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
        var holder = false
        let range = 0...9
        password.forEach { char in
            guard let number = char.wholeNumberValue else {return}
            if range.contains(number) {
                holder = true
            }
        }
        return holder
    }
}
