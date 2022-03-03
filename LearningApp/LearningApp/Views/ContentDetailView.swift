//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 24.02.22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        VStack {
            //Video must be hosted somewhere and we create a constant for this host
            let url = URL(string: Constants.hostingURL + (lesson?.video ?? ""))
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            CodeTextView()
            
            if model.hastNextLesson() {
                Button() {
                    model.nextLesson()
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                        
                        Text("Next lesson:\(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
            else {
                Button {
                    //This will put user to the Home screen
                    model.currentContentSelected = nil
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                        
                        Text("Complete")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }

            }
        }.padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
