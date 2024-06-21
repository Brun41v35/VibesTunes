import Foundation

final class NetworkManager {

    // MARK: - Private Properties

    private let session: URLSession

    // MARK: - Init

    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - Extension

extension NetworkManager: NetworkManagerType {

    func fetchData(typeSong: String,
                   completion: @escaping (APIResult) -> Void) {

        guard let url = URL(string: "https://itunes.apple.com/search?term=\(typeSong)+music&media=music&entity=musicTrack") else { return }
        let request = URLRequest(url: url)

        session.dataTask(with: request) { data, response, error in

            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let _ = response else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(Songs.self, from: data)
                completion(.success(decoderResponse))
            } catch {
                completion(.failure(.unableToComplete))
            }
        }
        .resume()
    }
}
