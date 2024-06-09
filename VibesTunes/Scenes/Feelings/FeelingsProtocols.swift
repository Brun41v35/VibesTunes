import UIKit

protocol NetworkManagerType {
    func fetchData(typeSong: String, completion: @escaping (APIResult) -> Void)
}

protocol FeelingsViewType where Self: UIView {
    var didTapHappyButton: (() -> Void)? { get set }
    var didTapNormalButton: (() -> Void)? { get set }
    var didTapSadButton: (() -> Void)? { get set }
    func startLoading()
    func stopLoading()
    func showFailureMessage()
}

protocol FeelingsPresenterType {
    var viewController: FeelingsViewControllerType? { get set }
    func loadData(with feeling: String)
}

protocol FeelingsAdapterType {
    func adapt(songs: Songs) -> SongsModel
}

protocol FeelingsViewControllerType: AnyObject {
    func pushSongsViewController(with viewModel: SongsModel)
    func startLoading()
    func stopLoading()
    func showFailureMessage()
}
