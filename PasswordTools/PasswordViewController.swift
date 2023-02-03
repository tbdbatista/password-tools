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

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupComponentViews()
        passwordView.textField.delegate = self
        secondaryPasswordView.textField.delegate = self
    }

    // MARK: - Setup Components
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
        resetButton.addTarget(self, action: #selector(didTapConfirmPassword), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc
    private func didTapConfirmPassword() {
        confirmReenteredPassword()
        textFieldResignFirstResponder()
    }

    // MARK: - Methods
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

    private func textFieldResignFirstResponder() {
        passwordView.textField.resignFirstResponder()
        secondaryPasswordView.textField.resignFirstResponder()
    }
}

// MARK: - Extension - UITextFieldDelegate
extension PasswordViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)
    }
}
