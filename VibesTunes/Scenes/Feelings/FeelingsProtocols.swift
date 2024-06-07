import Foundation

protocol NetworkManagerType {
    typealias Response = Swift.Result<(Songs), Error>

    func fetchData(typeSong: String, completion: @escaping (Response) -> Void)
}
