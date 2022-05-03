import SwiftUI

struct CardView: View {
    @StateObject var meditationVM: MeditationViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(meditationVM.meditation.image)
                .frame(width: 100, height: 100)
            
            Text(meditationVM.meditation.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(meditationVM.meditation.description)
                .lineLimit(4)
            
            Text("1 Minute - 60 Seconds")
                .opacity(0.8)
        }
        .padding(.all)
        .background(Color(red: 24/255, green: 23/255, blue: 22/255))
        .cornerRadius(20)
        .foregroundColor(.white)
        .frame(width: 252, height: 359)
    }
}


