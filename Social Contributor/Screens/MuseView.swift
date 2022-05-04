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

    var body: some View {
        NavigationView {
            List {
                if viewModel.tracks.isEmpty {
                    ProgressView()
                } else {
                    ForEach(viewModel.tracks) { track in
                        Button(action: { viewModel.play(track) }) {
                            trackRow(track)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Muse")
        }
        .navigationViewStyle(.stack)
        .task {
            do {
                try await viewModel.fetchTracks()
            } catch {
                print(error)
            }
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

struct MuseView_Previews: PreviewProvider {
    static var previews: some View {
        MuseView()
    }
}

class MuseViewModel: ObservableObject {
    @Published private(set) var tracks: MusicItemCollection<Track> = []
    @Published private(set) var player = ApplicationMusicPlayer.shared

    @MainActor func fetchTracks() async throws {
        let url = URL(string: "https://api.music.apple.com/v1/me/recent/played/tracks")

        guard let url = url else { return }

        let request = MusicDataRequest(urlRequest: .init(url: url))
        let response = try await request.response()

        let tracks = try JSONDecoder().decode(MusicItemCollection<Track>.self, from: response.data)

        self.tracks = tracks
    }

    func play(_ track: Track) {
        player.queue = ApplicationMusicPlayer.Queue(for: tracks, startingAt: track)

        Task {
            do {
                try await player.play()
            } catch {
                print("Failed to prepare to play with error: \(error).")
            }
        }
    }
}
