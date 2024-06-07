import UIKit

final class FeelingsViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: FeelingsViewType
    private let network: NetworkManagerType

    // MARK: - Init

    init(contentView: FeelingsViewType = FeelingsView(),
         network: NetworkManagerType = NetworkManager()) {
        self.contentView = contentView
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
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        setupBindLayoutEvents()
    }

    private func setupBindLayoutEvents() {
        contentView.didTapSearchItem = { [weak self] in
            self?.loadData()
        }
    }

    private func loadData() {
        network.fetchData(typeSong: "sad") { result in
            switch result {
            case .success(let response):
                return // TODO: Handle response
            case .failure(let failure):
                return // TODO: Handle failure
            }
        }
    }
}
