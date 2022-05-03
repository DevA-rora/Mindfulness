import SwiftUI

struct MeditationView: View {
    @State private var showPlayer = false
    @StateObject var meditationVM: MeditationViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: Meditation Image (meditation view)
                Image(meditationVM.meditation.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height / 3)
                ZStack {
                    // MARK: Background Color
                    Color(red: 24/255, green: 23/255, blue: 22/255)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) { 
                            Text("Music")
                            
                            Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ??
                                 meditationVM.meditation.duration.formatted() + " Seconds")
                            
                        }
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .opacity(0.7)
                        
                        
                        // MARK: Title
                        Text(meditationVM.meditation.title)
                            .font(.title)
                        // MARK: Play Button (MeditationView)
                        Button {
                            showPlayer = true
                            print("Play button was tapped")
                        } label: {
                            Label("Play", systemImage: "play.fill")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.vertical, 10)  
                                .frame(maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(20)
                        }
                        
                        // MARK: Meditation Description
                        Text(meditationVM.meditation.description)
                        
                        Spacer()
                        
                    }
                    .foregroundColor(.white)
                    .padding(20)
                    // .padding(.top)
                }
                .frame(height: UIScreen.main.bounds.height * 2 / 3)
                .ignoresSafeArea()
            }
        }
        .navigationViewStyle(.stack)
        
        .fullScreenCover(isPresented: $showPlayer) { 
            PlayerView(meditationVM: meditationVM)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        MeditationView(meditationVM: meditationVM)
            .preferredColorScheme(.light)
    }
}
