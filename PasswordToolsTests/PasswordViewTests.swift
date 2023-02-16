//
//  PasswordViewTests.swift
//  PasswordToolsTests
//
//  Created by Beltrami Dias Batista, Thiago on 15/02/23.
//

import XCTest
@testable import PasswordTools

class PasswordViewTests: XCTestCase {

    private var validPassword = "Password!1"
    private var notEqualReenteredPassword = "Password!12"
    private var invalidPassword = "Password"
    private var invalidEqualPassword = "Password"
    private var validEqualPassword = "Password!1"
    private var passwordView: PasswordView!
    private var viewController: PasswordViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewController = PasswordViewController()
        passwordView = viewController.passwordView
    }

    override func tearDownWithError() throws {
        passwordView = nil
        try super.tearDownWithError()
    }

    func testReenteredPassword_WhenPressedConfirmButton_WithDifferentsPasswords_ShouldReturnError() {
        // Given
        viewController.passwordView.passwordView.textField.text = validPassword
        viewController.passwordView.secondaryPasswordView.textField.text = notEqualReenteredPassword
        viewController.viewDidLoad()

        // When
        passwordView.didTapReturn()

        // Then
        XCTAssertEqual(
            viewController.passwordView.secondaryPasswordView.errorLabel.text,
            "Passwords do not match",
            "When reentered password is not equal to entered password should return error."
        )
    }

    func testReenteredPassword_WhenPressedConfirmButton_WithInvalidPasswords_ShouldReturnError() {
        // Given
        viewController.passwordView.passwordView.textField.text = invalidPassword
        viewController.passwordView.secondaryPasswordView.textField.text = notEqualReenteredPassword
        viewController.viewDidLoad()

        // When
        passwordView.didTapReturn()

        // Then
        XCTAssertEqual(
            viewController.passwordView.passwordView.errorLabel.text,
            "Password does not match all criteria",
            "When reentered password is not equal to entered password should return error."
        )
    }

    func testReenteredPassword_WhenPressedConfirmButton_WithDifferentsPasswords_ShouldReturnTrue() {
        // Given
        viewController.passwordView.passwordView.textField.text = validPassword
        viewController.passwordView.secondaryPasswordView.textField.text = validEqualPassword
        viewController.viewDidLoad()

        // When
        passwordView.didTapReturn()

        // Then
        XCTAssertTrue(
            passwordView.passwordView.errorLabel.isHidden,
            "When passwords are valid and equal should not show error label. Property isHidden must be true."
        )
        XCTAssertTrue(
            passwordView.secondaryPasswordView.errorLabel.isHidden,
            "When passwords are valid and equal should not show error label. Property isHidden must be true."
        )
    }
}
