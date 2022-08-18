//
//  SettingsView.swift
//  Social Contributor
//
//  Created by Alex Logan on 04/05/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showIconSheet = false
    @EnvironmentObject var colorSchemeManager: AppColorSchemeManager
    @StateObject private var contributorsProvider: ContributorsProvider

    // This init is here to mute the following warning:
    // "Expression requiring global actor 'MainActor' cannot appear in default-value
    // expression of property '_contributorsProvider'; this is an error in Swift 6"
    // when using just:
    // @StateObject private var contributorsProvider = ContributorsProvider()
    // See more info:
    // https://tinyurl.com/5h2v9a75
    // https://twitter.com/andresr_develop/status/1509287460961927186
    init() {
        _contributorsProvider = StateObject(wrappedValue: ContributorsProvider())
    }

    var body: some View {
        NavigationView {
            List {
                general
                about
                contribution
                iconSwitcher
            }
            .navigationTitle(Text("Settings"))
        }
        .task {
            await contributorsProvider.fetchContributors()
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
                let githubUrl = Constants.URLPath.gitHubProject
                UIApplication.shared.open(githubUrl)
            }, label: {
                NavigationLink {
                    EmptyView()
                } label: {
                    Label("Github", systemImage: "chevron.left.forwardslash.chevron.right")
                        .labelStyle(SettingsLabelStyle(backgroundColor: .black.opacity(0.7)))
                }
            })

            Button(action: {
                let contributorsUrl = Constants.URLPath.gitHubContributors
                UIApplication.shared.open(contributorsUrl)
            }, label: {
                NavigationLink {
                    EmptyView()
                } label: {
                    Label(
                        contributorsProvider.contributors.isEmpty ?
                        "Contributors" : contributorsProvider.contributors,
                        systemImage: "person.3"
                    )
                    .labelStyle(SettingsLabelStyle(backgroundColor: .black.opacity(0.7)))
                    .lineLimit(3)
                }
            })

        }, header: {
            Text("Contribution & Contributors")
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
    
    var iconSwitcher: some View{
        Button(action:{
            showIconSheet.toggle()
        }) {
            HStack(spacing: 8){
                Image(systemName: "paperplane")
                
                Text("Change App Icon").kerning(1)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                
            }
            .padding(.vertical, 10)
            
        }.sheet(isPresented: $showIconSheet){
            IconSelectionView()
        }.environmentObject(IconNames())
    }
}
