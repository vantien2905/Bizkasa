//
//  PlayVideoHelper.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/28/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import AVKit

class PlayVideoHelper {
    static let shared = PlayVideoHelper()

    func playVideo(_ url: URL?) {
        guard let url = url else { return }
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        UIApplication.topViewController()?.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}
