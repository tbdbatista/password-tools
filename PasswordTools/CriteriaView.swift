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
    lazy var criteriaLabel = UILabel()
    lazy var lengthCriteriaView = SingleCriteriaView(text: "8-32 characters long")
    lazy var uppercaseCriteriaView = SingleCriteriaView(text: "uppercase letter (A-Z)")
    lazy var lowerCaseCriteriaView = SingleCriteriaView(text: "lowercase (a-z)")
    lazy var digitCriteriaView = SingleCriteriaView(text: "digit (0-9)")
    lazy var specialCharacterCriteriaView = SingleCriteriaView(text: "special character (e.g. !@#$%^)")

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
        self.addSubview(stackView)
        stackView.addArrangedSubview(criteriaLabel)
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
        setupCriteriaLabel()
    }

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 6

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }

    private func setupCriteriaLabel() {
        criteriaLabel.numberOfLines = 0
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()
    }

    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel

        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)

        let attributedText = NSMutableAttributedString(
            attributedString: NSMutableAttributedString(string: "", attributes: plainTextAttributes))
        attributedText.append(NSAttributedString(string: "Use all criteria below ", attributes: boldTextAttributes))
        attributedText.append(NSAttributedString(
            string: "to set new password:",
            attributes: plainTextAttributes)
        )

        return attributedText
    }}
