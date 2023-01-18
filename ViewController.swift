//
//  ViewController.swift
//  Avplayer
//
//  Created by Noye Samuel on 18/01/2023.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var playerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
// http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
// https://aegis-dev.s3.amazonaws.com/summarized_videos/69946f1d-9e73-402e-9947-236be4e9dd16/1726/highlights/highlights.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVFNIZGJGSZF3D6CY/20230118/eu-central-1/s3/aws4_request&X-Amz-Date=20230118T091446Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=154e70dbeb81951fdb55bf79c1c289fb65b9c5595f253df1b1fafc445eaedb3d
    @available(iOS 16.0, *)
    @IBAction func btnPlay(_ sender: Any) {
        guard let url = URL(string: "https://streamable.com/0ntwbq") else { return }
        
//        if let path = Bundle.main.path(forResource: "highlights", ofType: "mp4"){
//            let video = AVPlayer(url: URL(filePath: path))
//
//            let controller = AVPlayerViewController()
//            controller.player = video
//
//                // Modally present the player and call the player's play() method when complete.
//            present(controller, animated: true) {
//                video.play()
//            }
        
        
        
            // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

            // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

            // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.volume = 100.0
           // player.prepareToPlay()
            player.play()
        }
    }
}

