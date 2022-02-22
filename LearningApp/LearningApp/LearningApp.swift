//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 22.02.22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
