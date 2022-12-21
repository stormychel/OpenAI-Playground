//
//  OpenAI_PlaygroundApp.swift
//  OpenAI Playground
//
//  Created by Michel Storms on 21/12/2022.
//

import SwiftUI

@main
struct OpenAI_PlaygroundApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
