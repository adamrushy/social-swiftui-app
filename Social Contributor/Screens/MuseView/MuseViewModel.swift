//
//  File.swift
//  Social Contributor
//
//  Created by Yash Shah on 04/05/2022.
//

import Foundation
import MusicKit

class MuseViewModel: ObservableObject {
	@Published private(set) var tracks: MusicItemCollection<Track> = []
	@Published private(set) var player = ApplicationMusicPlayer.shared

	@MainActor func fetchTracks() async throws {
		let url = URL(staticString: "https://api.music.apple.com/v1/me/recent/played/tracks")

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
