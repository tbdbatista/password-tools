//
//  PasswordViewModelTests.swift
//  PasswordToolsTests
//
//  Created by Beltrami Dias Batista, Thiago on 15/02/23.
//

import XCTest
@testable import PasswordTools

class PasswordViewModelTests: XCTestCase {

    private var viewModel: PasswordViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = PasswordViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }

    // MARK: - PasswordLengthTests

    func testPasswordLength_WhenInvalidPasswordLengthShorterProvided_ShouldReturnFalse() {
        // Given password with less than 8 characters long
        let passwordWithInvalidLength = "1234567"

        // Then
        XCTAssertFalse(
            viewModel.lengthCriteriaMet(password: passwordWithInvalidLength),
            "Test should be false for strings with 7 or fewer characters."
        )
    }

    func testPasswordLength_WhenInvalidPasswordLengthBiggerProvided_ShouldReturnFalse() {
        // Given password with more than 32 characters long
        let passwordWithInvalidLength = "123456789012345678901234567890123"

        // Then
        XCTAssertFalse(
            viewModel.lengthCriteriaMet(password: passwordWithInvalidLength),
            "Test should be false for strings with 33 or more characters."
        )
    }

    func testPasswordLength_WhenValidPasswordWithEightCharactersLengthProvided_ShouldReturnFalse() {
        // Given password containing between 8 and 32 chars including
        let passwordWithEightCharactersLength = "12345678"

        // Then
        XCTAssertTrue(
            viewModel.lengthCriteriaMet(password: passwordWithEightCharactersLength),
            "Test should be true for strings containing between 8 and 32 characters including."
        )
    }

    func testPasswordLength_WhenValidPasswordWithThirtyTwoCharactersLengthProvided_ShouldReturnFalse() {
        // Given password containing between 8 and 32 chars including
        let passwordWithThirtyTwoCharactersLength = "12345678901234567890123456789012"

        // Then
        XCTAssertTrue(
            viewModel.lengthCriteriaMet(password: passwordWithThirtyTwoCharactersLength),
            "Test should be true for strings containing between 8 and 32 characters including."
        )
    }

    // MARK: - PasswordCaseTests

    func testPasswordCase_WhenInvalidPasswordWithNoUppercaseProvided_ShouldReturnFalse() {
        // Given password with only lowercase chars
        let passwordWithOnlyLowercaseChars = "password"

        // Then
        XCTAssertFalse(
            viewModel.uppercaseCriteriaMet(password: passwordWithOnlyLowercaseChars),
            "Test should be false for strings containing only lowercase characters."
        )
    }

    func testPasswordCase_WhenValidPasswordWithAtLeastOneUppercaseProvided_ShoulReturnTrue() {
        // Given password with at least one uppercase char
        let passwordWithUpperCase = "Password"

        // Then
        XCTAssertTrue(
            viewModel.uppercaseCriteriaMet(password: passwordWithUpperCase),
            "Test should be true for strings containing at least one uppercase character."
        )
    }

    func testPasswordCase_WhenInvalidPasswordWithNoLowercaseProvided_ShouldReturnFalse() {
        // Given password with only uppercased chars
        let passwordWithOnlyUppercaseChars = "PASSWORD"

        // Then
        XCTAssertFalse(
            viewModel.lowercaseCriteriaMet(password: passwordWithOnlyUppercaseChars),
            "Test should be false for strings containing only uppercase characters."
        )
    }

    func testPasswordCase_WhenValidPasswordWithAtLeastOneLowercaseProvided_ShoulReturnTrue() {
        // Given password with at least one Lowercase char
        let passwordWithLowercaseCase = "Password"

        // Then
        XCTAssertTrue(
            viewModel.lowercaseCriteriaMet(password: passwordWithLowercaseCase),
            "Test should be true for strings containing at least one Lowercase character."
        )
    }

}
