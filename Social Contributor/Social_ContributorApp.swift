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
            
            // This will silence the constraints errors displayed on the output window
            // swiftlint:disable: redundant_discardable_let
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(colorSchemeManager)
                .preferredColorScheme(colorSchemeManager.currentScheme)
        }
    }
}
