//
//  PasswordViewController.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordViewController: UIViewController {
    lazy var mainView = PasswordMainView(placeHolderText: "New password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupMainView()
    }
    
    private func setupSelfView() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .white
        self.view.addSubview(mainView)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupMainView() {
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainView.trailingAnchor, multiplier: 1),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}

