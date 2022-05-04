//
//  SettingsView.swift
//  Social Contributor
//
//  Created by Alex Logan on 04/05/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                aboutSection
                contributionSection
            }
            .navigationTitle(Text("Settings"))
        }
    }
    private var contributionSection: some View {
        Section(content: {
            Button(action: {
                guard let githubUrl = URL(string: "https://github.com/adamrushy/social-swiftui-app") else {
                    return
                }
                UIApplication.shared.open(githubUrl)
            }, label: {
                NavigationLink(destination: { EmptyView() }){
                    Label("Github", systemImage: "chevron.left.forwardslash.chevron.right")
                        .labelStyle(SettingsLabelStyle(backgroundColor: .black.opacity(0.7)))
                }
            })
        }, header: {
            Text("Contribution")
        }, footer: {
            Text("This app is an open source project started by @Adam9Rush, with contributions open.")
        })
    }

    private var aboutSection: some View {
        Section("About") {
            Label("Version " + String.basicBuildInfo(), systemImage: "terminal.fill")
                .labelStyle(SettingsLabelStyle(backgroundColor: .blue))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
