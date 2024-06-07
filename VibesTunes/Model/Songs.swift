struct Songs: Decodable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result

struct Result: Decodable {
    let artistName: String
    let trackName: String
    let previewURL: String
}
