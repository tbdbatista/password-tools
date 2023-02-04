//
//  PasswordView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/02/23.
//

import UIKit

class PasswordView: UIView {

    lazy var stackView = UIStackView()
    lazy var passwordView = PasswordMainView(placeHolderText: "New password")
    lazy var criteriaView = CriteriaView()
    lazy var secondaryPasswordView = PasswordMainView(placeHolderText: "Re-enter new password")
    lazy var resetButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelfView()
        setupComponentsViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Components
    private func setupSelfView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(passwordView)
        self.stackView.addArrangedSubview(criteriaView)
        self.stackView.addArrangedSubview(secondaryPasswordView)
        self.stackView.addArrangedSubview(resetButton)
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentsViews() {
        setupStackView()
        setupCriteriaView()
        setupResetButton()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }

    private func setupCriteriaView() {
        criteriaView.layer.cornerRadius = 4
        criteriaView.backgroundColor = .tertiarySystemFill
        criteriaView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func setupResetButton() {
        resetButton.setTitle("Reset password", for: [])
        resetButton.configuration = .filled()
    }
}
