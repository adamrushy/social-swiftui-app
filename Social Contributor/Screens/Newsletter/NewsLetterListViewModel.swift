//
//  NewsLetterListViewModel.swift
//  Social Contributor
//
//  Created by Mohammad Azam on 5/7/22.
//

import Foundation

class NewsLetterListViewModel: ObservableObject {
    
    @Published var newsLetters: [NewsLetterViewModel] = []
    
    func populateAllNewsLetters() {
        
        let newsLetters = NewsLetterService().load(Constants.FileName.newsletters)
        self.newsLetters = newsLetters.map(NewsLetterViewModel.init)
    }
    
}

struct NewsLetterViewModel: Identifiable {
    
    private var newsLetter: NewsLetter
    
    init(newsLetter: NewsLetter) {
        self.newsLetter = newsLetter
    }
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        newsLetter.name
    }
    
    var url: URL {
        newsLetter.url
    }
    
}
