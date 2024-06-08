import Foundation

final class FeelingsAdapter: FeelingsAdapterType {

    func adapt(songs: Songs) -> SongsModel {
        let listSongs = songs.results.map { value in
            return SongViewCellViewModel(nameArtist: value.artistName, nameSong: value.trackName)
        }
        return SongsModel(listSongs: listSongs)
    }
}
