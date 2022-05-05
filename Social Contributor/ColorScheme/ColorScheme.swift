//
//  ColorScheme.swift
//  Social Contributor
//
//  Created by Tunde Adegoroye on 05/05/2022.
//

import Foundation
import SwiftUI

enum AppColorScheme: Int {
    case light
    case dark
    case system
}

extension AppColorScheme {
    
    var title: String {
        switch self {
        case .light:
            return "🌞 Light"
        case .dark:
            return "🌚 Dark"
        case .system:
            return "📱 System"
        }
    }
}

extension AppColorScheme: Identifiable {
    var id: Self { self }
}

extension AppColorScheme: CaseIterable { }

final class AppColorSchemeManager: ObservableObject {
    
    @AppStorage("currentColorScheme") var colorScheme: Int = AppColorScheme.allCases.first!.rawValue // Force unwrap YOLO 🤪
    
    var currentScheme: ColorScheme? {
        guard let scheme = AppColorScheme(rawValue: colorScheme) else { return nil }
        switch scheme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
        }
    }
}
