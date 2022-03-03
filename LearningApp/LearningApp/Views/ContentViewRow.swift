//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 23.02.22.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model:ContentModel
    var index:Int
    
    var lesson:Lesson {
        if model.currentModule != nil &&
            index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        }
        else {
            return Lesson(id: 0, title: "", video: "", duration: "", explanation: "")
        }
    }
    
    var body: some View {
        ZStack(alignment:.leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing:30) {
                Text("\(lesson.id+1)")
                    .bold()
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
            }.padding()
            
        }.padding(.bottom, 5)
    }
}

