import Foundation

final class FeelingsPresenter {

    // MARK: - Internal Properties

    weak var viewController: FeelingsViewControllerType?

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

    private func fetchData(typeSong: String) {
        viewController?.startLoading()
        networkManager.fetchData(typeSong: typeSong) { [weak self] result in
            self?.handleInformations(result: result)
        }
    }

    private func handleInformations(result: APIResult) {
        viewController?.stopLoading()
        switch result {
        case .success(let response):
            let songsModel = adapter.adapt(songs: response)
            viewController?.pushSongsViewController(with: songsModel)
        case .failure:
            viewController?.showFailureMessage()
        }
    }
}

// MARK: - Extension

extension FeelingsPresenter: FeelingsPresenterType {

    func loadData(with feeling: String) {
        fetchData(typeSong: feeling)
    }
}
