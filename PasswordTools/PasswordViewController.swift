//
//  PasswordViewController.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordViewController: UIViewController {

    lazy var stackView = UIStackView()
    lazy var passwordView = PasswordMainView(placeHolderText: "New password")
    lazy var criteriaView = CriteriaView()
    lazy var secondaryPasswordView = PasswordMainView(placeHolderText: "Re-enter new password")
    lazy var resetButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupComponentViews()
    }

    private func setupSelfView() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(passwordView)
        self.stackView.addArrangedSubview(criteriaView)
        self.stackView.addArrangedSubview(secondaryPasswordView)
        self.stackView.addArrangedSubview(resetButton)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentViews() {
        setupStackView()
        setupCriteriaView()
        setupResetButton()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
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
