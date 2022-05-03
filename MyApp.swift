import SwiftUI

@main
struct MyApp: App {
    
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView(meditationVM: MeditationViewModel(meditation: Meditation.data))
                .environmentObject(audioManager)
        }
    }
}
