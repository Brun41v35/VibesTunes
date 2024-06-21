import Foundation

struct SongsModel {
    let nameArtist: String
    let nameSong: String
}

struct SongsList {

    static var mockData: [SongsModel] {
        return [
            SongsModel(nameArtist: "Slipknot",
                       nameSong: "Before I Forget"),

            SongsModel(nameArtist: "Iron Maiden",
                       nameSong: "Rainmaker"),

            SongsModel(nameArtist: "Ariana Grande",
                       nameSong: "Problem")
        ]
    }
}
