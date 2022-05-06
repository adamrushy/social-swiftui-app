//
//  SettingsView.swift
//  Social Contributor
//
//  Created by Alex Logan on 04/05/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var colorSchemeManager: AppColorSchemeManager
    
    var body: some View {
        NavigationView {
            List {
                general
                about
                contribution
            }
            .navigationTitle(Text("Settings"))
        }
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			SettingsView()

			SettingsView()
				.darkMode()
		}
        .environmentObject(AppColorSchemeManager())
    }
}
 
private extension SettingsView {
    
    var general: some View {
        Section("General") {
            
            Picker(selection: $colorSchemeManager.colorScheme) {
                ForEach(AppColorScheme.allCases) { item in
                    Text(item.title)
                        .tag(item.rawValue)
                }
            } label: {
                Text("App Theme")
            }
        }
    }
    
    var contribution: some View {
        Section(content: {
            Button(action: {
                guard let githubUrl = URL(string: "https://github.com/adamrushy/social-swiftui-app") else {
                    return
                }
                UIApplication.shared.open(githubUrl)
            }, label: {
                NavigationLink {
                    EmptyView()
                } label: {
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

    var about: some View {
        Section("About") {
            Label("Version " + String.basicBuildInfo(), systemImage: "terminal.fill")
                .labelStyle(SettingsLabelStyle(backgroundColor: .blue))
        }
    }
}
