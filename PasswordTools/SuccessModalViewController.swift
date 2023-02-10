//
//  SuccessModalViewController.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 10/02/23.
//

import UIKit

class SuccessModalViewController: UIViewController {
    let stackView = UIStackView()
    let mainLabel = UILabel()
    let imageView = UIImageView()

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupStackView()
        setupMainLabelView()
        setupImageView()
        setupActions()
    }

    // MARK: - Setup components
    private func setupSelfView() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(mainLabel)
        self.stackView.addArrangedSubview(imageView)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 18
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupMainLabelView() {
        mainLabel.text = "Success"
        mainLabel.textColor = .systemGreen
        mainLabel.font = UIFont(name: "Times", size: 28)
        mainLabel.textAlignment = .center
    }

    private func setupImageView() {
        imageView.image = UIImage(systemName: "checkmark.circle")
        imageView.tintColor = .systemGreen
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }

    private func setupActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    // MARK: - Actions
    @objc
    private func dismissKeyboard() {
        self.dismiss(animated: true, completion: nil)
    }
}
