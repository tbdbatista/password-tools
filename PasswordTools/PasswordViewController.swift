//
//  PasswordViewController.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordViewController: UIViewController {

    lazy var stackView = UIStackView()
    lazy var mainView = PasswordMainView(placeHolderText: "New password")
    lazy var criteriaView = CriteriaView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupComponentViews()
    }

    private func setupSelfView() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(mainView)
        self.stackView.addArrangedSubview(criteriaView)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentViews() {
        setupStackView()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }

}
