//
//  View+Extensions.swift
//  Social Contributor
//
//  Created by Mohammad Azam on 5/7/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
