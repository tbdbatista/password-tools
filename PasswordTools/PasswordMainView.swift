//
//  PasswordMainView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordMainView: UIView {
    
    lazy var lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    lazy var textField = UITextField()
    lazy var eyeButton = UIButton()
    var placeHolderText: String
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }

    //MARK: - Setup Views
    private func setupViews(){
        self.setupSelfView()
        self.setupLockImageView()
        self.setupEyeButton()
        self.setupMainTextField()
    }
    
    func setupSelfView() {
        self.backgroundColor = .green
        self.addSubview(lockImageView)
        self.addSubview(textField)
        self.addSubview(eyeButton)
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupLockImageView() {
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    func setupMainTextField() {
        textField.isSecureTextEntry = false
        textField.placeholder = placeHolderText
        textField.delegate = self
//        textField.keyboardType = .asciiCapable
        textField.attributedPlaceholder = NSAttributedString(string:placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1),
        ])
    }
    
    func setupEyeButton() {
        let eyeFilled = UIImage(systemName: "eye.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        let eyeSlashFill = UIImage(systemName: "eye.slash.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        eyeButton.setImage(eyeFilled, for: .normal)
        eyeButton.setImage(eyeSlashFill, for: .selected)
        
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        textField.rightView = eyeButton
        textField.rightViewMode = .always
    

        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
        ])
    }

    @objc func togglePasswordView() {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}

//MARK: - Extension - UITextFieldDelegate
extension PasswordMainView: UITextFieldDelegate {
    
}
