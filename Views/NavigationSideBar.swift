import SwiftUI

struct NavigationSideBar: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                VStack {
                    Image("user_background")
                        .frame(width: 100, height: 100)
                    // Placeholder frames, can change later
                        .clipShape(Circle())
                    
                    // Add user name and details:
                    
                    
                }
            }
            .padding()
            
            
            HStack {
                Image(systemName: "house")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Text("Home")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding()
            
            
            HStack {
                Image(systemName: "book.closed")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Text("Journal")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding()
            
            
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
                Spacer()
            }
            .padding()
            
            HStack {
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Text(" Profile")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct NavigationSideBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSideBar()
    }
}
// This is the image for the 3 lined menu buttonImage
// Image(systemName: "line.3.horizontal")
