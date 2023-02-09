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
}

extension PasswordViewController: PasswordViewProtocol {
    func editingEnded() {
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

    func editingChanged() {
        checkAllCriteria()
    }
}
