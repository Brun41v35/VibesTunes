import UIKit

final class FeelingsViewController: UIViewController {

    // MARK: - Private Properties

    private let network: NetworkManagerType

    private let searchItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search Item", for: .normal)
        button.configuration = .tinted()
        button.configuration?.baseBackgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
        setupBindLayoutEvents()
        setupBackgroundColor()
    }

    private func setupViewHierarchy() {
        view.addSubview(searchItemButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchItemButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupBindLayoutEvents() {
        searchItemButton.addTarget(self,
                                   action: #selector(didTapSearchItemButton),
                                   for: .touchUpInside)
    }

    private func setupBackgroundColor() {
        view.backgroundColor = .systemBackground
    }

    @objc
    private func didTapSearchItemButton() {
        network.fetchData(typeSong: "sad") {
            
        }
    }
}
