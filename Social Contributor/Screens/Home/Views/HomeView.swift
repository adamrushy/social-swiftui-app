//
//  HomeView.swift
//  Social Contributor
//
//  Created by Danijela Vrzan on 2022-05-22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var gradient = Gradient(
        colors: [
            Color.lightBlue,
            Color.darkBlue
        ]
    )

    var body: some View {
        VStack(alignment: .leading) {
            RadialGradient(
                gradient: gradient,
                center: .center,
                startRadius: 0,
                endRadius: 120
            )
            .frame(
                width: UIScreen.main.bounds.width,
                height: 180
            )
            .overlay(
                QuoteView(viewModel: viewModel)
            )
            .navigationTitle(Constants.NavigationTitle.home)

            Spacer()
        }
        .embedInNavigationView()
        .environmentObject(viewModel)
        .onAppear {
            viewModel.getRandomQuote()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
