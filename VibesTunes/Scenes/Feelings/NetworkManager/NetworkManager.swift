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
                   completion: @escaping (Response) -> Void) {

        guard let url = URL(string: "https://itunes.apple.com/search?term=\(typeSong)+music&media=music&entity=musicTrack") else { return }
        let request = URLRequest(url: url)

        session.dataTask(with: request) { data, response, error in

            if let error = error {
                completion(.failure(.unableToComplete))
                print("error: \(String(describing: error))")
                return
            }

            guard let response = response else {
                completion(.failure(.invalidResponse))
                print("something went wrong with response \(String(describing: response))")
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                print("something went wrong with data \(String(describing: data))")
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
