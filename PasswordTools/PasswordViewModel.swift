//
//  PasswordViewModel.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 08/02/23.
//

import Foundation

class PasswordViewModel {

    func lengthCriteriaMet(password: String) -> Bool {
        password.count >= 8 && password.count <= 32
    }

    func uppercaseCriteriaMet(password: String) -> Bool {
        password.lowercased() != password
    }

    func lowercaseCriteriaMet(password: String) -> Bool {
        password.uppercased() != password
    }

    func oneDigitCriteriaMet(password: String) -> Bool {
        password.range(of: ".*[0-9].*", options: .regularExpression) != nil
    }

    func specialCharacter(password: String) -> Bool {
        if !checkValidSpecialCharacter(password: password) {
            return false
        }
        return (password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil)
    }

    func checkValidSpecialCharacter(password: String) -> Bool {
        let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#^~*&-+<>{}[] "
        let invalidSet = CharacterSet(charactersIn: validChars).inverted
        if password.rangeOfCharacter(from: invalidSet) != nil {
            return false
        }
        return true
    }
}
