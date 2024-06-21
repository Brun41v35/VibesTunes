import SwiftUI

struct SongViewCell: View {

    var nameMusic: String
    var artistMusic: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(nameMusic)
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.bold)
                .lineLimit(2)
                .minimumScaleFactor(0.2)
            Text(artistMusic)
                .font(.system(size: 15, design: .rounded))
                .fontWeight(.light)
                .lineLimit(2)
                .minimumScaleFactor(0.2)
        }
    }
}

#Preview {
    SongViewCell(nameMusic: "nameMusic", artistMusic: "artistMusic")
}
