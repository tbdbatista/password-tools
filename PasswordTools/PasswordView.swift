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
    func shouldReturn() -> Bool
    func success()
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
        setupNotificationCenter()
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
        criteriaView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }

    private func setupResetButton() {
        resetButton.setTitle("Reset password", for: [])
        resetButton.configuration = .filled()
    }

    // MARK: - Setup Actions and Notification Center
    private func setupActions() {
        resetButton.addTarget(self, action: #selector(didTapConfirmPassword), for: .touchUpInside)
        passwordView.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.addGestureRecognizer(tap)
    }

    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Actions
    @objc
    private func dismissKeyboard() {
        self.endEditing(true)
    }

    @objc
    private func didTapConfirmPassword() {
        confirmReenteredPassword()
        textFieldResignFirstResponder()
    }

    @objc
    private func textFieldEditingChanged() {
        delegate?.editingChanged()
    }

    @objc
    private func keyboardWillShow(sender: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame.origin.y = 0
            self.layoutIfNeeded()
        })

        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }

        if currentTextField == secondaryPasswordView.textField {

            let keyboardTopY = keyboardFrame.cgRectValue.origin.y
            let convertedTextFieldFrame = self.convert(currentTextField.frame, from: currentTextField.superview)
            let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height

            if (keyboardTopY) < textFieldBottomY + 16 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.frame.origin.y -= (textFieldBottomY - keyboardTopY + 32)
                    self.layoutIfNeeded()
                })
            }
        }
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame.origin.y = 0
            self.layoutIfNeeded()
        })
        }

    // MARK: - Methods
    private func textFieldResignFirstResponder() {
        passwordView.textField.resignFirstResponder()
        secondaryPasswordView.textField.resignFirstResponder()
    }

    private func confirmReenteredPassword() {
        if criteriaView.checkAllCriteriaState() {
            if  passwordView.textFieldText == secondaryPasswordView.textFieldText {
                delegate?.success()
            } else {
                secondaryPasswordView.errorLabel.isHidden = false
                updateErrorLabel(string: "Passwords do not match", label: secondaryPasswordView.errorLabel)
            }
        } else {
            passwordView.errorLabel.isHidden = false
            updateErrorLabel(string: "Password does not match all criteria", label: passwordView.errorLabel)
        }
    }

    func didTapReturn() {
        confirmReenteredPassword()
        textFieldResignFirstResponder()
    }

    func getPassword() -> String {
        passwordView.textFieldText ?? ""
    }

    func updateErrorLabel(string: String, label: UILabel) {
        label.text = string
    }
}

// MARK: - Extension - UITextFieldDelegate
extension PasswordView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.editingEnded()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        passwordView.errorLabel.isHidden = true
        passwordView.errorLabel.text = ""
        secondaryPasswordView.errorLabel.isHidden = true
        secondaryPasswordView.errorLabel.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.shouldReturn() ?? false
    }
}
