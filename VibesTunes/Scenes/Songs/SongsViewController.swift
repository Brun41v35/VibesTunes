import UIKit

final class SongsViewController: UITableViewController {

    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupTableView()
    }

    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 120
    }
}

// MARK: - Extension

extension SongsViewController {

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
