//
//  TestView.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 27.02.22.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        if model.currentQuestion != nil {
            VStack(alignment: .leading) {
                Text("Question \((model.currentQuestionIndex + 1) ) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading)
                CodeTextView()
                    .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        //The index of current button
                        ForEach(0..<model.currentQuestion!.answers.count, id:\.self) {index in
                        //Variants of answers button
                            Button {
                                selectedAnswerIndex = index
                            } label: {
                                ZStack {
                                //If user hasn't submitted the answer,than the "Rectangle" can be only "gray" or "white"
                                    if !submitted {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height:48)
                                    }
                                    else {
                                //If it's the button user has selected and it's the correct one
                                        if (index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex) || index == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .green)
                                                .frame(height:48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            RectangleCard(color:.red)
                                                .frame(height:48)
                                        }
                                        else {
                                            RectangleCard(color: .white)
                                                .frame(height:48)
                                        }
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }.padding(.horizontal)
                                .foregroundColor(.black)
                            }
                        //Just disables the button, if it's true
                            .disabled(submitted)
                        }
                    }
                }
            }.navigationTitle("\(model.currentModule?.category ?? "") Test")
                .padding([.top, .leading, .trailing])
            //Submit button
            Button {
                //If the button is used to advance to another question
                if submitted == true {
                    submitted = false
                    selectedAnswerIndex = nil
                    model.nextQuestion()
                }
                //If the button is used to sumbit the answer
                else {
                    submitted = true
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                        numCorrect += 1
                    }
                }
            } label: {
                ZStack {
                    RectangleCard(color: .green)
                        .frame(height:48)
                    Text(buttonText)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                }
            }.padding([.leading, .bottom, .trailing])
            .disabled(selectedAnswerIndex == nil)
        }
        else {
            TestResultView(numCorrect: numCorrect)
        }
    }
    
    var buttonText:String {
        if submitted {
            if model.currentQuestionIndex == model.currentModule!.test.questions.count - 1 {
                return "Finish"
            }
            else {
                return "Next Question"
            }
        }
        else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
