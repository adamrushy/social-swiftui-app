//
//  ContentView.swift
//  Social Contributor
//
//  Created by Adam Rush on 04/05/2022.
//  Edited by Florian Schweizer on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Hello, Home!")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
