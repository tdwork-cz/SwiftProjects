//
//  ContentModel.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 22.02.22.
//

import Foundation
import SwiftUI

class ContentModel:ObservableObject {
    @Published var modules:[Module] = [Module]()
    var styleData:Data?
    
    //Current Module
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    //Current Lesson
    @Published var currentLesson:Lesson?
    var currentLessonIndex = 0
    
    //Current Question
    @Published var currentQuestion:Question?
    var currentQuestionIndex = 0
    
    //Current lesson explanation
    //This is HTML + CSS string
    @Published var codeText = NSAttributedString()
    
    //Current selected content a test
    @Published var currentContentSelected:Int?
    @Published var currentTestSelected:Int?
    
    init() {
        getLocalData()
        getRemoteData()
    }
    
    //MARK: - Data methods
    
    //MARK: - Module navigation methods
    
    func beginModule(_ moduleId: Int) {
        //Find the index for the ID
        if moduleId < modules.count {
            currentModuleIndex = moduleId
        }
        else {
            currentModuleIndex = 0
        }
        //Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonId: Int) {
        if lessonId < currentModule!.content.lessons.count {
            currentLessonIndex = lessonId
        }
        else {
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        //It's gonna call "updateUIView" method
        codeText = addStyling(currentLesson!.explanation)
    }
    
    func hastNextLesson() -> Bool {
        guard currentModule != nil else {
            return false
        }
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    func beginTest(_ moduleId:Int) {
        beginModule(moduleId)
        currentQuestionIndex = 0
        //If there are questions, set the current question to the first one
        if currentModule!.test.questions.count > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(currentQuestion!.content)
        }
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
        if currentQuestionIndex < currentModule!.test.questions.count {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(currentQuestion!.content)
        }
        else {
            currentQuestionIndex = 0
            currentQuestion = nil
        }
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeText = addStyling(currentLesson!.explanation)
    }

    
    func getLocalData() {
        let pathJSON = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathJSON {
            let url = URL(fileURLWithPath: path)
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let modulesData = try decoder.decode([Module].self, from: data)
                
                self.modules += modulesData
            }
            catch {
                print(error.self)
            }
        }
        
        let urlHTML = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let data = try Data(contentsOf: urlHTML!)
            self.styleData = data
        }
        catch {
            print(error.self)
        }
    }
    
    func getRemoteData() {
        let urlString = "https://tdwork-cz.github.io/SwiftProjects/learning-app.json"
        let urlWeb = URL(string:urlString)
        
        if let url = urlWeb {
            let request = URLRequest(url:url)
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let modulesData = try decoder.decode([Module].self, from: data!)
                    
                    //Here we put the code, which updates the UI
                    //self.modules in published and Views are depended on it
                    DispatchQueue.main.async {
                        //Now main thread is doing it assynchronisly
                        //No backround thread involving
                        self.modules += modulesData
                    }
                }
                catch {
                    print(error.self)
                }
            }
            dataTask.resume()
        }
    }
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        //Add the styling data
        if styleData != nil
        {
            data.append(self.styleData!)
        }
        //Add the html data
        data.append(Data(htmlString.utf8))
        //Convert to attributed string
        //"try?" is used insted of "do <-> catch" block
        if let attributedString = try? NSAttributedString(data: data,
                                                          options: [.documentType:NSAttributedString.DocumentType.html],
                                                          documentAttributes: nil) {
            resultString = attributedString
        }
        return resultString
    }
    
}
