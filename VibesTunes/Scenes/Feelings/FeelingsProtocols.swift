import UIKit

protocol NetworkManagerType {
    typealias Response = Swift.Result<(Songs), APIError>

    func fetchData(typeSong: String, completion: @escaping (Response) -> Void)
}

protocol FeelingsViewType where Self: UIView {
    var didTapSearchItem: (() -> Void)? { get set }
}
