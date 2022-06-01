//
// Created for Social Contributor
// by Stewart Lynch on 2022-05-07
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI
import StoreKit

enum AppReviewRequest {
    // Adjust this threshold as you see fit.
    static var threshold = 3
    @AppStorage("runSinceLastRequest") static var runsSinceLastRequest = 0
    @AppStorage("version") static var version = ""
    static func requestReviewIfNeeded() {
        runsSinceLastRequest += 1
        guard let appBuild = Bundle
            .main
            .object(forInfoDictionaryKey: "CFBundleVersion") as? String else { return }
        guard let appVersion = Bundle
            .main
            .object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else { return }
        let thisVersion = "\(appVersion).\(appBuild)"
#if DEBUG
        print("Run Count: \(runsSinceLastRequest)/\(threshold)")
        print("Version: \(thisVersion)")
#endif
        // Only present if new version
        guard thisVersion != version  else { runsSinceLastRequest = 0; return }
        // Only present review if threshold has been met
        guard runsSinceLastRequest >= threshold else { return }
        if let scene = UIApplication
            .shared
            .connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
            version = thisVersion
            runsSinceLastRequest = 0
        }
    }
}
