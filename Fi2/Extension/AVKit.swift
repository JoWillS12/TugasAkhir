//
//  AVKit.swift
//  Fi2
//
//  Created by Joseph William Santoso on 28/05/23.
//

import SwiftUI
import AVKit

struct AVPlayerView: UIViewControllerRepresentable {
    var videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // No additional update is needed
    }
}

