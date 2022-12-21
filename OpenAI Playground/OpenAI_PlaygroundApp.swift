//
//  OpenAI_PlaygroundApp.swift
//  OpenAI Playground
//
//  Created by Michel Storms on 21/12/2022.
//

import SwiftUI
import OpenAI

@main
struct OpenAI_PlaygroundApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        example_Answers()
    }

    func example_Answers() {
        let apiKey: String = "f8f13444ceb103ca46ac6ef5c28ec730a1fd8ded" // required
        let client = Client(apiKey: apiKey)

        let documents: [String] = [
            "Puppy A is happy.",
            "Puppy B is sad."
        ]

        let question = "which puppy is happy?"

        let examples: (context: String, [(question: String, answer: String)]) = (
            context: "In 2017, U.S. life expectancy was 78.6 years.",
            [
                (question: "What is human life expectancy in the United States?", answer: "78 years.")
            ]
        )

        client.answer(engine: .curie,
                      question: question,
                      examples: examples,
                      documents: documents,
                      searchEngine: .ada,
                      stop: ["\n", "<|endoftext|>"]) { result in
            
            print("result: \(result)")
            
            guard case .success(let response) = result else { return }

            print (response.answers.first) // "puppy A."
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
