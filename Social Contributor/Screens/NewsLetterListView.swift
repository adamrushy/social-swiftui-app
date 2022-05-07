//
//  NewsLetterListView.swift
//  Social Contributor
//
//  Created by Mohammad Azam on 5/7/22.
//

import SwiftUI

struct NewsLetterListView: View {
    
    @StateObject private var vm = NewsLetterListViewModel()
    
    var body: some View {
        
        List(vm.newsLetters) { newsLetter in
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
            vm.populateAllNewsLetters()
        }
    }
}

struct NewsLetterListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsLetterListView()
    }
}
