import UIKit

final class FeelingsViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: FeelingsViewType
    private let presenter: FeelingsPresenterType

    // MARK: - Init

    init(contentView: FeelingsViewType = FeelingsView(),
         presenter: FeelingsPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
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
            self?.presenter.loadData()
        }
    }
}

// MARK: - FeelingsViewControllerType

extension FeelingsViewController: FeelingsViewControllerType {

    func pushSongsViewController(with viewModel: SongsModel) {

        #warning("TODO: Improve call `DispatchQueue.main.async`")

        DispatchQueue.main.async {
            let songsViewController = SongsViewController(songsModel: viewModel)
            self.navigationController?.pushViewController(songsViewController, animated: true)
        }
    }
}
