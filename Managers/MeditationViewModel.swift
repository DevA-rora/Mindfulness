import Foundation
import SwiftUI

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 Minute Meditation", description: "Clear your mind and calm yourself down, bring attention to yourself and how your feeling.", duration: 244, track: "Cyber’sWorld", image: "meditation-background")
    
    // now you can change the "data" in meditationVM to be data2
    static let data2 = Meditation(title: "2 Minute Meditation", description: "Relax and stuff, bring attention to yourself and how you are doing here is some extra words", duration: 230, track: "chaosking", image: "meditation-background2")
    
    static let data3 = Meditation(title: "3 Minute Meditation", description: "Relax and other things, bring attention to yourself and how you are doing allocate 3 minutes for a breather", duration: 200, track: "Finale", image: "meditation-background3")
}
