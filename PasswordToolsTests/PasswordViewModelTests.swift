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

    func testPasswordLength_WhenInvalidPasswordLengthProvided_ShouldReturnFalse() {
        // Given password with less than 8 characters long
        let passwordWithInvalidLength = "1234567"

        // Then
        XCTAssertFalse(
            viewModel.lengthCriteriaMet(password: passwordWithInvalidLength),
            "Test should be false for strings with 7 or fewer characters."
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
}
