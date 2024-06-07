import UIKit

final class FeelingsView: UIView, FeelingsViewType {

    // MARK: - Internal Properties

    var didTapSearchItem: (() -> Void)?

    // MARK: - Private Properties

    private let searchItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search Item", for: .normal)
        button.configuration = .tinted()
        button.configuration?.baseBackgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
        setupBindLayoutEvents()
        setupBackgroundColor()
    }

    private func setupViewHierarchy() {
        addSubview(searchItemButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchItemButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchItemButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupBindLayoutEvents() {
        searchItemButton.addTarget(self,
                                   action: #selector(didTapSearchItemButton),
                                   for: .touchUpInside)
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }

    @objc
    private func didTapSearchItemButton() {
        didTapSearchItem?()
    }
}
