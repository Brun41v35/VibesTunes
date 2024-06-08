import UIKit

final class FeelingsView: UIView {

    // MARK: - Internal Properties

    var didTapHappyButton: (() -> Void)?
    var didTapNormalButton: (() -> Void)?
    var didTapSadButton: (() -> Void)?

    // MARK: - Private Properties

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
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
        addSubview(loadingView)
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(happyFeelingButton)
        containerStackView.addArrangedSubview(normalFeelingButton)
        containerStackView.addArrangedSubview(sadFeelingButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            happyFeelingButton.heightAnchor.constraint(equalToConstant: 50),
            normalFeelingButton.heightAnchor.constraint(equalToConstant: 50),
            sadFeelingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupBindLayoutEvents() {
        happyFeelingButton.addTarget(self,
                                     action: #selector(didTapHappyAction),
                                     for: .touchUpInside)

        normalFeelingButton.addTarget(self,
                                      action: #selector(didTapNormalAction),
                                      for: .touchUpInside)

        sadFeelingButton.addTarget(self,
                                   action: #selector(didTapSadAction),
                                   for: .touchUpInside)
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }

    @objc
    private func didTapHappyAction() {
        didTapHappyButton?()
    }

    @objc
    private func didTapNormalAction() {
        didTapNormalButton?()
    }

    @objc
    private func didTapSadAction() {
        didTapSadButton?()
    }
}


// MARK: - FeelingsViewType

extension FeelingsView: FeelingsViewType {

    func startLoading() {
        containerStackView.isHidden = true
        loadingView.startAnimating()
    }

    func stopLoading() {
        containerStackView.isHidden = false
        loadingView.stopAnimating()
    }
}
