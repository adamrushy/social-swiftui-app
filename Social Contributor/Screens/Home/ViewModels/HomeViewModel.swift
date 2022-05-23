//
//  HomeViewModel.swift
//  Social Contributor
//
//  Created by Danijela Vrzan on 2022-05-22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var quote: Quote!
    var quotes: [Quote] = Bundle.main.decode(Constants.FileName.quotes)

    init() {
        getRandomQuote()
    }

    func getRandomQuote() {
        guard let randomQuote = quotes.randomElement() else {
            quote = Constants.placeholderQuote
            return
        }
        quote = randomQuote
    }
}
