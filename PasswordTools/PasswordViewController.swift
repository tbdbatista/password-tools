//
//  PasswordViewController.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordViewController: UIViewController {

    let passwordView = PasswordView(frame: .zero)
    let viewModel = PasswordViewModel()

    // MARK: - ViewController Lifecycle
    override func loadView() {
        view = passwordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAllCriteria()
        passwordView.delegate = self
    }

    // MARK: - Methods
    private func checkLengthCriteria() {
        viewModel.lengthCriteriaMet(password: passwordView.getPassword())
            ? passwordView.criteriaView.lengthCriteriaView.metCriteria = true
            : passwordView.criteriaView.lengthCriteriaView.resetCriteria()
    }
    private func checkUppercaseCriteria() {
        viewModel.uppercaseCriteriaMet(password: passwordView.getPassword())
            ? passwordView.criteriaView.uppercaseCriteriaView.metCriteria = true
            : passwordView.criteriaView.uppercaseCriteriaView.resetCriteria()
    }
    private func checkLowercaseCriteria() {
        viewModel.lowercaseCriteriaMet(password: passwordView.getPassword())
            ? passwordView.criteriaView.lowerCaseCriteriaView.metCriteria = true
            : passwordView.criteriaView.lowerCaseCriteriaView.resetCriteria()
    }
    private func checkDigitCriteria() {
        viewModel.oneDigitCriteriaMet(password: passwordView.getPassword())
            ? passwordView.criteriaView.digitCriteriaView.metCriteria = true
            : passwordView.criteriaView.digitCriteriaView.resetCriteria()
    }
    private func checkSpecialCharCriteria() {
        viewModel.specialCharacter(password: passwordView.getPassword())
            ? passwordView.criteriaView.specialCharacterCriteriaView.metCriteria = true
            : passwordView.criteriaView.specialCharacterCriteriaView.resetCriteria()
    }
    private func checkAllCriteria() {
        checkLengthCriteria()
        checkUppercaseCriteria()
        checkLowercaseCriteria()
        checkDigitCriteria()
        checkSpecialCharCriteria()
    }

    private func checkCriteriaWhenEditingEnded() {
        if !viewModel.lengthCriteriaMet(password: passwordView.getPassword()) {
            (passwordView.criteriaView.lengthCriteriaView.metCriteria = false)
        }
        if !viewModel.uppercaseCriteriaMet(password: passwordView.getPassword()) {
            (passwordView.criteriaView.uppercaseCriteriaView.metCriteria = false)
        }
        if !viewModel.lowercaseCriteriaMet(password: passwordView.getPassword()) {
            (passwordView.criteriaView.lowerCaseCriteriaView.metCriteria = false)
        }
        if !viewModel.oneDigitCriteriaMet(password: passwordView.getPassword()) {
            (passwordView.criteriaView.digitCriteriaView.metCriteria = false)
        }
        if !viewModel.specialCharacter(password: passwordView.getPassword()) {
            (passwordView.criteriaView.specialCharacterCriteriaView.metCriteria = false)
        }
    }
}

extension PasswordViewController: PasswordViewProtocol {
    func success() {
        let successViewController = SuccessModalViewController()
        successViewController.modalPresentationStyle = .overCurrentContext
        self.present(successViewController, animated: true, completion: nil)
    }

    func shouldReturn() -> Bool {
        if passwordView.passwordView.textField.isFirstResponder {
            if passwordView.criteriaView.checkAllCriteriaState() {
                passwordView.secondaryPasswordView.textField.becomeFirstResponder()
            } else {
                checkCriteriaWhenEditingEnded()
                return false
            }
        } else {
            passwordView.didTapReturn()
        }
        return true
    }

    func editingEnded() {
        checkCriteriaWhenEditingEnded()
    }

    func editingChanged() {
        checkAllCriteria()
        if !viewModel.checkValidSpecialCharacter(password: passwordView.getPassword()) {
            passwordView.updateErrorLabel(
                string: "Please, for special character use space or one of the following: .,@:?!()$\\/#^~*&-+<>{}[]",
                label: passwordView.passwordView.errorLabel
            )
            passwordView.passwordView.errorLabel.isHidden = false
        } else {
            passwordView.updateErrorLabel(
                string: "",
                label: passwordView.passwordView.errorLabel
            )
            passwordView.passwordView.errorLabel.isHidden = true
        }
    }
}
