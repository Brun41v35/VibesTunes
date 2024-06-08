import UIKit

final class FeelingsView: UIView, FeelingsViewType {

    // MARK: - Internal Properties

    var didTapSearchItem: (() -> Void)?

    // MARK: - Private Properties

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let sadFeelingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sad", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemRed
        button.layer.opacity = 0.4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let normalFeelingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Normal", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.layer.opacity = 0.4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let happyFeelingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Happy", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGreen
        button.layer.opacity = 0.4
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
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(happyFeelingButton)
        containerStackView.addArrangedSubview(normalFeelingButton)
        containerStackView.addArrangedSubview(sadFeelingButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupBindLayoutEvents() {
        sadFeelingButton.addTarget(self,
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
