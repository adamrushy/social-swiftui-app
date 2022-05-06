//
//  LottieView.swift
//  Social Contributor
//
//  Created by Yash Shah on 04/05/2022.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
	let lottieFile: String

	let animationView = AnimationView()

	func makeUIView(context: Context) -> some UIView {
		let view = UIView(frame: .zero)

		animationView.animation = Animation.named(lottieFile)
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .playOnce
		animationView.play()

		view.addSubview(animationView)

		animationView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
			animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
		])

		return view
	}

	func updateUIView(_ uiView: UIViewType, context: Context) {
	}
}

struct LottieView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			LottieView(lottieFile: "no-results-found")

			LottieView(lottieFile: "no-results-found")
				.darkMode()
		}
	}
}
