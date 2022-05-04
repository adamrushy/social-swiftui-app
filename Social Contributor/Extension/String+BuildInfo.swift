//
//  String+BuildInfo.swift
//  Social Contributor
//
//  Created by Alex Logan on 04/05/2022.
//

import Foundation

extension String {
    public static func basicBuildInfo() -> String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        return version
    }
}
