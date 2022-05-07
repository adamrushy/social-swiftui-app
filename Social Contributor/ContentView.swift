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
            
            NewsLetterListView() 
                .tabItem {
                    Label("Newsletters", systemImage: "newspaper")
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
            await musicKitAuthentication()
        }
    }
}

extension ContentView {
    private func musicKitAuthentication() async {
        do {
            // Fetch  developer token to see if the current device is simulator or real device.
            _ = try await MusicDataRequest.tokenProvider.developerToken(options: .ignoreCache)

            let status = await MusicAuthorization.request()

            if status == .authorized {
                showMuseView = true
            } else {
                // If permission is anything other than `authorized`, do not show `MuseView`.
                showMuseView = false
            }
        } catch {
            // If the device is a simulator, do not show `MuseView`.
            showMuseView = false
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
