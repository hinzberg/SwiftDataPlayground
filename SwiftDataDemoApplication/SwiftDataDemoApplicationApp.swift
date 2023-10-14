//
//  SwiftDataDemoApplicationApp.swift
//  SwiftDataDemoApplication
//
//  Created by Holger Hinzberg on 14.10.23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApplicationApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
