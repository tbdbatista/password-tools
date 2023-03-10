//
//  SingleCriteriaView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 21/01/23.
//

import UIKit

class SingleCriteriaView: UIView {

    lazy var stackView = UIStackView()
    lazy var imageView = UIImageView()
    lazy var textLabel = UILabel()

    let checkmarkImage = UIImage(systemName: "checkmark.circle")!
        .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xMarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)

    var metCriteria: Bool = false {
        didSet {
            if metCriteria {
                imageView.image = checkmarkImage
            } else {
                imageView.image = xMarkImage
            }
        }
    }

    init(text: String) {
        super.init(frame: .zero)
        textLabel.text = text
        setupView()
        setupComponentsView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }

    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        stackView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentsView() {
        setupStackView()
        setupImageView()
        setupTextLabel()
    }

    private func setupStackView() {
        stackView.spacing = 8
        stackView.distribution = .fill

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupImageView() {
        imageView.image = xMarkImage
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }

    private func setupTextLabel() {
        textLabel.textAlignment = .left
        textLabel.textColor = .secondaryLabel
        textLabel.font = .preferredFont(forTextStyle: .subheadline)
        textLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }

    // MARK: - Methods
    func resetCriteria() {
        metCriteria = false
        imageView.image = circleImage
    }
}
