import UIKit

final class SongsViewController: UITableViewController {

    // MARK: - Private Properties

    private let identifier = "SongViewCell"
    private let songsModel: SongsModel

    // MARK: - Init

    init(songsModel: SongsModel) {
        self.songsModel = songsModel
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
        setupNavigationBar()
        setupTableView()
    }

    private func setupNavigationBar() {
        title = "Sugestões de Músicas"
    }

    private func setupTableView() {
        tableView.register(SongViewCell.self, forCellReuseIdentifier: identifier)
    }
}

// MARK: - Extension

extension SongsViewController {

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? SongViewCell else {
            return UITableViewCell()
        }

        let viewModel = songsModel.listSongs[indexPath.row]

        cell.show(viewModel: viewModel)
        cell.selectionStyle = .none

        return cell
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return songsModel.listSongs.count
    }
}
