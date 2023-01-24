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
    lazy var singleCriteriaView1 = SingleCriteriaView()
    lazy var singleCriteriaView2 = SingleCriteriaView()
    lazy var singleCriteriaView3 = SingleCriteriaView()
    lazy var singleCriteriaView4 = SingleCriteriaView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        setupSelfView()
        setupComponentViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)")
    }

//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 100)
//    }

    // MARK: - View Setup
    private func setupSelfView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(singleCriteriaView1)
        stackView.addArrangedSubview(singleCriteriaView2)
        stackView.addArrangedSubview(singleCriteriaView3)
        stackView.addArrangedSubview(singleCriteriaView4)

        translatesAutoresizingMaskIntoConstraints = false
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupComponentViews() {
        setupStackView()
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.backgroundColor = .green

        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
