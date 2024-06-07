import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

protocol NetworkManagerType {
    typealias Response = Swift.Result<(Songs), APIError>

    func fetchData(typeSong: String, completion: @escaping (Response) -> Void)
}
