//
//  TestResultView.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 1.03.22.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model:ContentModel
    var numCorrect:Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(resultHeading)")
                .font(.title)
            Spacer()
            Text("You have got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0)")
            Spacer()
            Button {
                model.currentTestSelected = nil
            } label: {
                ZStack {
                    RectangleCard(color: .green)
                        .frame(height:48)
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }.padding()
            }
            Spacer()
        }
    }
    
    var resultHeading:String {
        let percent = Double(numCorrect)/Double(model.currentModule?.test.questions.count ?? numCorrect)
        if percent < 0.3 {
            return "You should try one more time"
        }
        else if percent < 0.7 {
            return "Keep learning"
        }
        else {
            return "Awesome"
        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(numCorrect: 1)
    }
}
