//
//  ContentModel.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 22.02.22.
//

import Foundation

class ContentModel:ObservableObject {
    @Published var modules:[Module] = [Module]()
    var styleData:Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        let pathJSON = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathJSON {
            let url = URL(fileURLWithPath: path)
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let modulesData = try decoder.decode([Module].self, from: data)
                
                self.modules = modulesData
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
}
