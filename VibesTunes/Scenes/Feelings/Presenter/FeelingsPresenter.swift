import Foundation

final class FeelingsPresenter {

    // MARK: - Private Properties

    private let networkManager: NetworkManagerType
    private let adapter: FeelingsAdapterType
    
    // MARK: - Init

    init(networkManager: NetworkManagerType,
         adapter: FeelingsAdapterType = FeelingsAdapter()) {
        self.networkManager = networkManager
        self.adapter = adapter
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
            let viewModel = adapter.adapt(songs: response)
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
