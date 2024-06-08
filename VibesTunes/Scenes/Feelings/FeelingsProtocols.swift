import UIKit

protocol NetworkManagerType {
    func fetchData(typeSong: String, completion: @escaping (APIResult) -> Void)
}

protocol FeelingsViewType where Self: UIView {
    var didTapSearchItem: (() -> Void)? { get set }
}

protocol FeelingsPresenterType {
    var viewController: FeelingsViewControllerType? { get set }
    func loadData()
}

protocol FeelingsAdapterType {
    func adapt(songs: Songs) -> SongsModel
}

protocol FeelingsViewControllerType: AnyObject {
    func pushSongsViewController(with viewModel: SongsModel)
}
