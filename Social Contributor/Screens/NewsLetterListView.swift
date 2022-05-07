//
//  NewsLetterListView.swift
//  Social Contributor
//
//  Created by Mohammad Azam on 5/7/22.
//

import SwiftUI

struct NewsLetterListView: View {
    
    @StateObject private var viewModel = NewsLetterListViewModel()
    
    var body: some View {
        
        List(viewModel.newsLetters) { newsLetter in
            HStack {
                Link(newsLetter.name, destination: newsLetter.url)
                Spacer() 
                Image(systemName: "chevron.right")
            }
        }
        .navigationTitle("Newsletters")
        .embedInNavigationView()
        .listStyle(.plain)
        .onAppear {
            viewModel.populateAllNewsLetters()
        }
    }
}

struct NewsLetterListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsLetterListView()
    }
}
