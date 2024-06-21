import SwiftUI

struct SongViewCell: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Name Music")
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.bold)
                .lineLimit(2)
                .minimumScaleFactor(0.2)
            Text("Artist Name")
                .font(.system(size: 15, design: .rounded))
                .fontWeight(.light)
                .lineLimit(2)
                .minimumScaleFactor(0.2)
        }
    }
}

#Preview {
    SongViewCell()
}
