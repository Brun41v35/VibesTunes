import UIKit

protocol NetworkManagerType {
    func fetchData(typeSong: String, completion: @escaping (APIResult) -> Void)
}

protocol FeelingsViewType where Self: UIView {
    var didTapSearchItem: (() -> Void)? { get set }
}

protocol FeelingsPresenterType {
    func loadData()
}
