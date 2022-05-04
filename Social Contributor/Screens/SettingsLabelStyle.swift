//
//  SettingsLabelStyle.swift
//  Social Contributor
//
//  Created by Alex Logan on 04/05/2022.
//

import Foundation
import SwiftUI

struct SettingsLabelStyle: LabelStyle {
    // Base all sizing on the current accessibility scale so everyone can read it.
    @ScaledMetric var accessibilityScale: CGFloat = 1

    var cornerRadius: CGFloat {
        6 * accessibilityScale
    }
    var iconFrameSize: CGFloat {
        28 * accessibilityScale
    }

    let backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: iconFrameSize, height: iconFrameSize, alignment: .center)
                .foregroundColor(backgroundColor)
                .overlay(
                    configuration.icon
                        .font(font)
                        .foregroundColor(.white)
                )
            configuration.title
                .layoutPriority(1)
                .font(font)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }

    var font: Font {
        .body.weight(.medium)
    }
}

struct SettingsLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Label("Contribute", systemImage: "person.badge.plus")
                .labelStyle(SettingsLabelStyle(backgroundColor: .orange))
            Label("Help", systemImage: "questionmark.circle.fill")
                .labelStyle(SettingsLabelStyle(backgroundColor: .blue))
            Label("Contact", systemImage: "mail")
                .labelStyle(SettingsLabelStyle(backgroundColor: .pink))
        }
    }
}

