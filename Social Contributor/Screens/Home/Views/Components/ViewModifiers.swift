//
//  ViewModifiers.swift
//  Social Contributor
//
//  Created by Danijela Vrzan on 2022-05-23.
//

import SwiftUI

struct QuoteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black, radius: 1, x: 2, y: 2)
            .padding(.horizontal, 15)
            .foregroundColor(.white)
            .font(.headline)
    }
}

extension View {
    func quoteViewModifier() -> some View {
        modifier(QuoteViewModifier())
    }
}
