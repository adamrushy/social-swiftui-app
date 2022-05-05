//
//  Social_ContributorApp.swift
//  Social Contributor
//
//  Created by Adam Rush on 04/05/2022.
//

import SwiftUI

@main
struct Social_ContributorApp: App {
    
    @StateObject private var colorSchemeManager = AppColorSchemeManager()

    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(colorSchemeManager)
                .preferredColorScheme(colorSchemeManager.currentScheme)
        }
    }
}
