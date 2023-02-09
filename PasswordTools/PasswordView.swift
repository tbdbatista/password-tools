//
//  PasswordView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/02/23.
//

import UIKit

protocol PasswordViewProtocol {
    func editingChanged()
    func editingEnded()
}

class PasswordView: UIView {

    lazy var stackView = UIStackView()
    lazy var passwordView = PasswordMainView(placeHolderText: "New password")
    lazy var criteriaView = CriteriaView()
    lazy var secondaryPasswordView = PasswordMainView(placeHolderText: "Re-enter new password")
    lazy var resetButton = UIButton()

    var delegate: PasswordViewProtocol?

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
        setupActions()
        passwordView.textField.delegate = self
        secondaryPasswordView.textField.delegate = self
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

    // MARK: - Setup Actions
    private func setupActions() {
        resetButton.addTarget(self, action: #selector(didTapConfirmPassword), for: .touchUpInside)
        passwordView.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }

    // MARK: - Actions
    @objc
    private func didTapConfirmPassword() {
        confirmReenteredPassword()
        textFieldResignFirstResponder()
    }

    @objc
    private func textFieldEditingChanged() {
        delegate?.editingChanged()
    }

    // MARK: - Methods
    private func textFieldResignFirstResponder() {
        passwordView.textField.resignFirstResponder()
        secondaryPasswordView.textField.resignFirstResponder()
    }

    private func confirmReenteredPassword() {
        guard let firstPassword = passwordView.textField.text,
              passwordView.textField.text != "",
              let secondPassword = secondaryPasswordView.textField.text,
              secondaryPasswordView.textField.text != "" else {
                  print("senhas não podem ser nulas")
                  return }
        if  firstPassword == secondPassword {
            print("senhas iguais")
        } else {
            print("senhas diferentes")
        }
    }

    func getPassword() -> String {
        passwordView.textField.text ?? ""
    }
}

// MARK: - Extension - UITextFieldDelegate
extension PasswordView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.editingEnded()
    }
}
