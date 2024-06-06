import Foundation

final class NetworkManager {}

// MARK: - Extension

extension NetworkManager: NetworkManagerType {

    func fetchData() {

        //        guard let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(terms)") else { return }

        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson") else { return }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                print("error: \(String(describing: error))")
                return
            }

            guard let response = response else {
                print("something went wrong with response \(String(describing: response))")
                return
            }

            guard let data = data else {
                print("something went wrong with data \(String(describing: data))")
                return
            }

            let decoded = String(data: data, encoding: .utf8)
            print("Data: \(String(describing: decoded))")
        }
        .resume()
    }
}
