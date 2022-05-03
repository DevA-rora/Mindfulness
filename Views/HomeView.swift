import SwiftUI

struct HomeView: View {
    @State var tabBarOpen = false
    @StateObject var meditationVM: MeditationViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: true) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<2) { item in
                            NavigationLink(destination: MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data))) {
                                CardView(meditationVM: MeditationViewModel(meditation: Meditation.data))
                            }
                            NavigationLink(destination: MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data2))) {
                                CardView(meditationVM: MeditationViewModel(meditation: Meditation.data2))
                            }
                            NavigationLink(destination: MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data3))) {
                                CardView(meditationVM: MeditationViewModel(meditation: Meditation.data3))
                            }
                        }
                    }
                    
                    .padding()
                }
            }
            .navigationTitle("Mindfulness")
            .toolbar { 
                NavigationLink(destination: NavigationSideBar()) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    // This is all placeholder code for a real navigation side bar so come back to fix this later
                }
            }
        }
        .accentColor(.blue)
        // This is the color of the navigation elements
        // This can be changed by changing the color in .accentColor
        .navigationViewStyle(.stack)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(meditationVM: MeditationViewModel(meditation: Meditation.data))
            .preferredColorScheme(.light)
    }
}

