import SwiftUI

struct SongViewCell: View {
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Name Music")
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.bold)
            Text("Artist Name")
                .font(.system(size: 15, design: .rounded))
                .fontWeight(.light)
        }
    }
}

#Preview {
    SongViewCell()
}
