import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                HStack {
                    // MARK Dismiss Button
                    Button {
                        print("xmarks was tapped")
                        audioManager.stop()
                        // This is so that when the user exits the page, the music will stop aswell
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                // MARK: Playback
                
                if let player = audioManager.player {
                    VStack(spacing: 5) {
                        // MARK: Playback
                        Slider(value: $value, in: 0...player.duration) { editing in
                            print("Editing", editing)
                            isEditing = editing
                            if !editing {
                                print("Editing false")
                                // This may be the wrong print message so if this is the case, change this
                                player.currentTime = value
                            } 
                        } 
                        //audioManager.player?.duration)
                            .accentColor(.white)
                        // MARK: Playback Time
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    // MARK Playback Control
                    HStack {
                        // MARK: Repeat Button
                        PlaybackControlButton(systemName: "repeat") {
                            print("repeat was tapped")
                            audioManager.toggleLoop()
                        } 
                        .keyboardShortcut("r")
                        // For some reason, keyboard shortcuts don't seem to be working in apps made with swift playgrounds
                        
                        Spacer()
                        // MARK: Backward Button
                        PlaybackControlButton(systemName: "gobackward.10") {
                            print("gobackward.10 was tapped")
                            player.currentTime -= 10
                            // The line of code above can be easily modified to go back for a different ammount of time
                        }
                        .keyboardShortcut(KeyEquivalent.leftArrow, modifiers: [])
                        
                        Spacer()
                        // MARK: Play / Pause Button
                        PlaybackControlButton(systemName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                            audioManager.playPause()
                            print("Play button was tapped")
                        }
                        // .keyboardShortcut()
                        // Add in keyboard shortcuts that allow for media buttons to be used for this app
                        
                        
                        Spacer()
                        // MARK: Forward Button
                        PlaybackControlButton(systemName: "goforward.10") {
                            print("goforward.10 was tapped")
                            player.currentTime += 10
                            // The line of code above can be easily modified to go back for a different ammount of time
                        }
                        .keyboardShortcut(KeyEquivalent.rightArrow, modifiers: [])
                        
                        Spacer()
                        // MARK: Stop Button
                        PlaybackControlButton(systemName: "stop.fill") {
                            print("stop.fill was tapped")
                            audioManager.stop()
                            dismiss()
                        }
                    }
                }
            }
            .padding(30)
        }
        .onAppear { 
            // AudioManager.shared.playSound(track: meditationVM.meditation.track, type: "m4a")
            audioManager.playSound(track: meditationVM.meditation.track, type: "m4a")
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            
            value = player.currentTime
        }
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Replace this with your PlayerView if you need to debug")
    }
}
