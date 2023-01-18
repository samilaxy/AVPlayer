# AVPlayer

Set Up the Audio Session
You use an audio session to communicate to the system how you intend to use audio in your app. The audio session acts as an intermediary between your app and the operating system—and, in turn, the underlying audio hardware. Configure the audio session to give your app the audio behavior expected of a media playback app.

Use import AVFoundation to add the AVFoundation framework to the AppDelegate.swift class.

In the application(_:didFinishLaunchingWithOptions:) method, retrieve the shared instance of the audio session and set the app’s audio session category to playback and mode to moviePlayback.

// Set Up the Audio Session
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    let audioSession = AVAudioSession.sharedInstance()
    do {
        try audioSession.setCategory(.playback, mode: .moviePlayback)
    }
    catch {
        print("Setting category to AVAudioSessionCategoryPlayback failed.")
    }
    return true
}

Set Up and Configure the User Interface
After configuring your app’s audio session, you need to create the user interface for the player.

Open the Main.storyboard file. In the Library’s search field, type button to find the Button object.

Drag the Button object into the View Controller Scene’s view and give it the title Play Video.

Add alignment constraints to center the button both horizontally and vertically.

Xcode constraints window with the horizontal and vertical alignment options selected.

Implement Playback Behavior
Now that you have created the user interface, it’s time to add the code required to play a video.

In the Project Navigator, select the Main.storyboard file and open the assistant editor.

Control-drag from the Play Video button to the ViewController.swift class to add a new @IBAction method called playVideo.

Close the assistant editor and select the ViewController.swift class in the Project Navigator. Above the class definition, import the AVKit and AVFoundation frameworks.

In the playVideo method, add the following code, making sure to replace the URL with one that points to a real video file available on the public internet:

@IBAction func playVideo(_ sender: UIButton) {
    guard let url = URL(string: "https://example.com/my-example-video.m3u8") else { return }

    // Create an AVPlayer, passing it the HTTP Live Streaming URL.
    let player = AVPlayer(url: url)

    // Create a new AVPlayerViewController and pass it a reference to the player.
    let controller = AVPlayerViewController()
    controller.player = player

    // Modally present the player and call the player's play() method when complete.
    present(controller, animated: true) {
        player.play()
    }
}
Your app is complete, and you can run it in the Simulator or on your iOS or tvOS device.
