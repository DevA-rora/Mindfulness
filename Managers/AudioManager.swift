import Foundation
import AVKit

final class AudioManager: ObservableObject {
    // static let shared = AudioManager()
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    @Published private(set) var isLooping: Bool = false
    
    func playSound(track: String, type: String) {
        guard let url = Bundle.main.url(forResource: track, withExtension: type) else {
            print("Resource not Found! \(track)")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to initilize the player", error)
        }
        
        if player?.isPlaying == true {
            print("Music is playing")
        }
    }
    func playPause() {
        guard let player = player else {
            print("Instance of audio player not found!")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    func stop() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
    }
}
