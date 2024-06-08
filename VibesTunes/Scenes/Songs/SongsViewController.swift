import UIKit

final class SongsViewController: UITableViewController {

    // MARK: - Private Properties

    private let songsModel = SongsModel(listSongs: [
        SongViewCellViewModel(nameArtist: "nameArtist", nameSong: "nameSong"),
        SongViewCellViewModel(nameArtist: "nameArtist", nameSong: "nameSong"),
        SongViewCellViewModel(nameArtist: "nameArtist", nameSong: "nameSong"),
        SongViewCellViewModel(nameArtist: "nameArtist", nameSong: "nameSong")
    ])

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(SongViewCell.self, forCellReuseIdentifier: "SongViewCell")
    }
}

// MARK: - Extension

extension SongsViewController {

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongViewCell", for: indexPath) as? SongViewCell else {
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
