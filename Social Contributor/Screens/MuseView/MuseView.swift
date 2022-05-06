//
//  MuseView.swift
//  Social Contributor
//
//  Created by Rudrank Riyam on 05/05/22.
//

import SwiftUI
import MusicKit

struct MuseView: View {
    @StateObject private var viewModel = MuseViewModel()
	@State private var alertPresented = false
	@State private var alertMessage = ""

    var body: some View {
        NavigationView {
            Group {
                if viewModel.tracks.isEmpty {
					VStack {
						LottieView(lottieFile: "no-results-found")
							.frame(height: UIScreen.main.bounds.height/2, alignment: .top).padding(.top)
						Text("Sorry.\nWe have nothing to play for you.")
							.multilineTextAlignment(.center)
							.lineLimit(nil)
							.font(.title2.weight(.semibold))
							.foregroundColor(.primary)

						Button {
							Task { await reloadData() }
						} label: {
							Text("Try Again")
						}
						.buttonStyle(.bordered)
						.padding()

						Spacer()
					}
                } else {
					List {
						ForEach(viewModel.tracks) { track in
                            Button {
                                viewModel.play(track)
                            } label: {
                                trackRow(track)
                            }
							.buttonStyle(.plain)
						}
					}
					.refreshable { await reloadData() }
				}
            }
            .navigationTitle("Muse")
        }
        .navigationViewStyle(.stack)
        .task { await reloadData() }
		.alert("Oops! Something Went Wrong.", isPresented: $alertPresented) {
			Button("Cancel", action: {})
			Button("Try again") {
				Task { await reloadData() }
			}
		} message: {
			Text(alertMessage)
		}

    }

	private func reloadData() async {
		do {
			try await viewModel.fetchTracks()
		} catch {
			alertPresented.toggle()
			alertMessage = error.localizedDescription
		}
	}

    private func trackRow(_ track: Track) -> some View {
        HStack {
            if let artwork = track.artwork {
                ArtworkImage(artwork, height: 50)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                Text(track.title)
                    .font(.headline)

                Text(track.artistName)
                    .font(.subheadline)
            }
        }
        .padding(8)
    }
}

// Lottie File credit - https://assets8.lottiefiles.com/packages/lf20_3qzrm0wa.json

struct MuseView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			MuseView()

			MuseView()
				.darkMode()
		}
    }
}
