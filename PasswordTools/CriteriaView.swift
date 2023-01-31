//
//  CriteriaView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 20/01/23.
//

import Foundation

import UIKit

class CriteriaView: UIView {

    lazy var contentStackView = UIView()
    lazy var stackView = UIStackView()
    lazy var singleCriteriaView1 = SingleCriteriaView(text: "Uppercase letter(A-Z)")
    lazy var singleCriteriaView2 = SingleCriteriaView(text: "What am I doing?")
    lazy var singleCriteriaView3 = SingleCriteriaView(text: "Is this the real life?")
    lazy var singleCriteriaView4 = SingleCriteriaView(text: "Is it just fantasy?")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelfView()
        setupComponentViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)")
    }

    // MARK: - View Setup
    private func setupSelfView() {
        self.addSubview(contentStackView)
        contentStackView.addSubview(stackView)
        stackView.addArrangedSubview(singleCriteriaView1)
        stackView.addArrangedSubview(singleCriteriaView2)
        stackView.addArrangedSubview(singleCriteriaView3)
        stackView.addArrangedSubview(singleCriteriaView4)

        translatesAutoresizingMaskIntoConstraints = false
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        contentStackView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentViews() {
        setupStackView()
    }

    private func setupStackView() {
        contentStackView.backgroundColor = .secondarySystemBackground

        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading

        NSLayoutConstraint.activate([
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 16)
        ])
    }
}
