//
//  PasswordViewControllerTests.swift
//  PasswordToolsTests
//
//  Created by Beltrami Dias Batista, Thiago on 15/02/23.
//

import XCTest
@testable import PasswordTools

class PasswordViewControllerTests: XCTestCase {

    private var validPassword = "Password!1"
    private var invalidPassword = "senha"
    private var viewController: PasswordViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewController = PasswordViewController()
    }

    override func tearDownWithError() throws {
        viewController = nil
        try super.tearDownWithError()
    }

    func testPasswordCriteriaView_WhenEditingEnded_ShouldReturnAllTrue() {
        viewController.passwordView.passwordView.textField.text = validPassword
        viewController.viewDidLoad()

        // Given PasswordViewController with a valid password
        viewController.editingEnded()

        // Then
        XCTAssertTrue(
            viewController.passwordView.criteriaView.lengthCriteriaView.metCriteria,
            "Criteria met: password length 8 - 32 characters, for valid password should be true when end editing TextField."
        )
        XCTAssertTrue(
            viewController.passwordView.criteriaView.uppercaseCriteriaView.metCriteria,
            "Criteria met: at least one uppercase character, for valid password should be true when end editing TextField."
        )
        XCTAssertTrue(
            viewController.passwordView.criteriaView.lowerCaseCriteriaView.metCriteria,
            "Criteria met: at least one lowercase character, for valid password should be true when end editing TextField."
        )
        XCTAssertTrue(
            viewController.passwordView.criteriaView.digitCriteriaView.metCriteria,
            "Criteria met: at least one digit, for valid password should be true when end editing TextField."
        )
        // Valid special chars including space => .,@:?!()$\\/#^~*&-+<>{}[]
        XCTAssertTrue(
            viewController.passwordView.criteriaView.specialCharacterCriteriaView.metCriteria,
            "Criteria met: at least one special character, for valid password should be true when end editing TextField."
        )
    }

    func testPasswordCriteriaView_WhenEditingEnded_ShouldReturnAllFalse() {
        viewController.passwordView.passwordView.textField.text = invalidPassword
        viewController.viewDidLoad()

        // Given PasswordViewController with a invalid password
        viewController.editingEnded()

        // Then
        XCTAssertFalse(
            viewController.passwordView.criteriaView.lengthCriteriaView.metCriteria,
            "Criteria met: password length 8 - 32 characters, for invalid password should be false when end editing TextField."
        )
        XCTAssertFalse(
            viewController.passwordView.criteriaView.uppercaseCriteriaView.metCriteria,
            "Criteria met: at least one uppercase character, for invalid password should be false when end editing TextField."
        )

        XCTAssertFalse(
            viewController.passwordView.criteriaView.digitCriteriaView.metCriteria,
            "Criteria met: at least one digit, for invalid password should be false when end editing TextField."
        )
        // Valid special chars including space => .,@:?!()$\\/#^~*&-+<>{}[]
        XCTAssertFalse(
            viewController.passwordView.criteriaView.specialCharacterCriteriaView.metCriteria,
            "Criteria met: at least one special character, for invalid password should be false when end editing TextField."
        )
    }
}
