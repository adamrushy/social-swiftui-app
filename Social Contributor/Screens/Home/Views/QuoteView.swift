//
//  QuoteView.swift
//  Social Contributor
//
//  Created by Danijela Vrzan on 2022-05-22.
//

import SwiftUI

struct QuoteView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Text(viewModel.quote.text)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Text("- \(viewModel.quote.author)")
        }
        .quoteViewModifier()
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(viewModel: HomeViewModel())
    }
}
