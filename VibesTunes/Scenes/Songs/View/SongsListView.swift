import SwiftUI

struct SongsListView: View {

    let songList = SongsList.mockData

    var body: some View {
        List(songList, id: \.id) { song in
            SongViewCell(nameMusic: song.nameSong,
                         artistMusic: song.nameArtist)
        }
    }
}

#Preview {
    SongsListView()
}
