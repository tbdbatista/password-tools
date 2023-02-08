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
    }
}
