import SwiftUI

struct SongsListView: View {
    var body: some View {
        List {
            SongViewCell()
        }
    }
}

#Preview {
    SongsListView()
}
