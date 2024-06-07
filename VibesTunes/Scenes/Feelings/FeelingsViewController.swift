import UIKit

final class FeelingsViewController: UIViewController {

    // MARK: - Private Properties

    private let network: NetworkManagerType

    // MARK: - Init

    init(network: NetworkManagerType = NetworkManager()) {
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = FeelingsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private Methods
}
