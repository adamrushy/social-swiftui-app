//
//  View+Theme.swift
//  Social Contributor
//
//  Created by Yash Shah on 04/05/2022.
//

import Foundation
import SwiftUI

extension View {
	// Force Dark Mode
	func darkMode() -> some View {
		self.preferredColorScheme(.dark)
	}
	
	// Force Light mode Mode
	func lightMode() -> some View {
		self.preferredColorScheme(.light)
	}
}
