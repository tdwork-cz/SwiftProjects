//
//  ContentView.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 22.02.22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) {m in
                            VStack(spacing:17) {
                                //When a user select a module, the tag is "module.id"
                                NavigationLink(tag: m.id, selection: $model.currentContentSelected) {
                                    ContentView()
                                        .onAppear {
                                            model.beginModule(m.id)
                                        }
                                } label: {
                                    HomeViewRow(image: m.content.image, title: "Learn \(m.category)", description: m.content.description, count: "\(m.content.lessons.count) Lessons", time: m.content.time)
                                }
                                //Test card
                                NavigationLink(tag: m.id, selection: $model.currentTestSelected) {
                                    TestView()
                                        .onAppear {
                                            model.beginTest(m.id)
                                        }
                                } label: {
                                    HomeViewRow(image: m.test.image, title: "\(m.category) Test", description: m.test.description, count: "\(m.test.questions.count) Questions", time: m.test.time)
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.padding()
                }
            }.navigationTitle("Get Started")
                .onChange(of: model.currentContentSelected) { changedValue in
                    if changedValue == nil {
                        model.currentModule = nil
                    }
                }
                .onChange(of: model.currentTestSelected) { changedValue in
                    if changedValue == nil {
                        model.currentModule = nil
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
