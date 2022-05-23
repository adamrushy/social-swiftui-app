//
//  Constants.swift
//  Social Contributor
//
//  Created by Mohammad Azam on 5/7/22.
//

import Foundation

struct Constants {
    static let placeholderQuote = Quote(
        text: "If you're waiting until you feel talented enough to make it, you'll never make it.",
        author: "Criss Jami"
    )

    struct FileName {
        static let newsletters = "newsletters"
        static let quotes = "quotes.json"
    }

    struct NavigationTitle {
        static let home = "Welcome"
        static let settings = "Settings"
        static let newsletters = "Newsletters"
    }

    struct Color {
        static let lightBlue = "light-blue"
        static let darkBlue = "dark-blue"
    }

    struct URLPath {
        static let gitHubContributors = URL(
            staticString: "https://api.github.com/repos/adamrushy/social-swiftui-app/contributors"
        )
        static let gitHubProject = URL(
            staticString: "https://github.com/adamrushy/social-swiftui-app"
        )
    }
}
