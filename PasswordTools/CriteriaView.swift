//
//  CriteriaView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 20/01/23.
//

import Foundation

import UIKit

class CriteriaView: UIView {

    lazy var stackView = UIStackView()
    lazy var lengthCriteriaView = SingleCriteriaView(text: "8-32 characters (no spaces)")
    lazy var uppercaseCriteriaView = SingleCriteriaView(text: "uppercase letter (A-Z)")
    lazy var lowerCaseCriteriaView = SingleCriteriaView(text: "lowercase (a-z)")
    lazy var digitCriteriaView = SingleCriteriaView(text: "digit (0-9)")
    lazy var specialCharacterCriteriaView = SingleCriteriaView(text: "special character (e.g. !@#$%^)")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelfView()
        setupComponentViews()
        self.backgroundColor = .gray
        stackView.backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)")
    }

    // MARK: - View Setup
    private func setupSelfView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)

        translatesAutoresizingMaskIntoConstraints = false
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentViews() {
        setupStackView()
    }

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.distribution = .equalCentering

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
}
