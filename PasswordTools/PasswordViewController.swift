//
//  PasswordViewController.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordViewController: UIViewController {

    let passwordView = PasswordView(frame: .zero)

    // MARK: - ViewController Lifecycle
    override func loadView() {
        view = passwordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        passwordView.passwordView.textField.delegate = self
        passwordView.secondaryPasswordView.textField.delegate = self
    }

    // MARK: - Setup Actions
    private func setupActions() {
        passwordView.resetButton.addTarget(self, action: #selector(didTapConfirmPassword), for: .touchUpInside)
        passwordView.passwordView.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }

    // MARK: - Actions
    @objc
    private func didTapConfirmPassword() {
        confirmReenteredPassword()
        textFieldResignFirstResponder()
    }

    @objc
    private func textFieldEditingChanged() {
        print(passwordView.passwordView.textField.text)
    }

    // MARK: - Methods
    private func confirmReenteredPassword() {
        guard let firstPassword = passwordView.passwordView.textField.text,
              passwordView.passwordView.textField.text != "",
              let secondPassword = passwordView.secondaryPasswordView.textField.text,
              passwordView.secondaryPasswordView.textField.text != "" else {
                  print("senhas não podem ser nulas")
                  return }
        if  firstPassword == secondPassword {
            print("senhas iguais")
        } else {
            print("senhas diferentes")
        }
    }

    private func textFieldResignFirstResponder() {
        passwordView.passwordView.textField.resignFirstResponder()
        passwordView.secondaryPasswordView.textField.resignFirstResponder()
    }
}

// MARK: - Extension - UITextFieldDelegate
extension PasswordViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
