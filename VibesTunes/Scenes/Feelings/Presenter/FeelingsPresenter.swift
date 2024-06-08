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
        networkManager.fetchData(typeSong: "sad") { result in
            switch result {
            case .success(let response):
                return // TODO: Handle response
            case .failure(let failure):
                return // TODO: Handle failure
            }
        }
    }
}

// MARK: - Extension

extension FeelingsPresenter: FeelingsPresenterType {

    func loadData() {
        fetchData()
    }
}
