import Foundation

final class FeelingsPresenter {

    // MARK: - Private Properties

    private let networkManager: NetworkManagerType

    // MARK: - Init

    init(networkManager: NetworkManagerType) {
        self.networkManager = networkManager
    }

    // MARK: - Private Methods

    private func fetchData() {
        networkManager.fetchData(typeSong: "sad") { [weak self] result in
            self?.handleInformations(result: result)
        }
    }

    private func handleInformations(result: APIResult) {
        switch result {
        case .success(let response):
            let listSongs = response.results.map { value in
                return SongViewCellViewModel(nameArtist: value.artistName, nameSong: value.trackName)
            }
            let viewModel = SongsModel(listSongs: listSongs)
        case .failure(let failure):
            return // TODO: Handle failure
        }
    }
}

// MARK: - Extension

extension FeelingsPresenter: FeelingsPresenterType {

    func loadData() {
        fetchData()
    }
}
