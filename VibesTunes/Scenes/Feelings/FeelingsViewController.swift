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
        setupNavigationTitle()
        setupBindLayoutEvents()
    }

    private func setupNavigationTitle() {
        title = "Olá!"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupBindLayoutEvents() {
        contentView.didTapHappyButton = { [weak self] in
            self?.presenter.loadData(with: "Happy")
        }

        contentView.didTapNormalButton = { [weak self] in
            self?.presenter.loadData(with: "Random")
        }

        contentView.didTapSadButton = { [weak self] in
            self?.presenter.loadData(with: "Sad")
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

    func startLoading() {
        contentView.startLoading()
    }

    func stopLoading() {
        #warning("TODO: Improve call `DispatchQueue.main.async`")
        DispatchQueue.main.async {
            self.contentView.stopLoading()
        }
    }

    func showFailureMessage() {
        #warning("TODO: Improve call `DispatchQueue.main.async`")
        DispatchQueue.main.async {
            self.contentView.showFailureMessage()
        }
    }
}
