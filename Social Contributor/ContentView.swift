//
//  ContentView.swift
//  Social Contributor
//
//  Created by Adam Rush on 04/05/2022.
//  Edited by Florian Schweizer on 04/05/2022.
//

import SwiftUI
import MusicKit

struct ContentView: View {
    @State private var showMuseView = false

    var body: some View {
        TabView {
            Text("Hello, Home!")
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            if showMuseView {
                MuseView()
                    .tabItem {
                        Label("Muse", systemImage: "wand.and.stars.inverse")
                    }
            }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .onAppear {
                    /*
                     This can be called on any view that would be
                     appropriate for presenting a Review Request once the
                     threshold has been met.
                     */
                    AppReviewRequest.requestReviewIfNeeded()
                }
        }
        .task {
            let status = await MusicAuthorization.request()

            if status == .authorized {
                showMuseView.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ContentView()

			ContentView()
				.darkMode()
		}
	}
}
