//
//  UIResponderExtension.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 11/02/23.
//

import UIKit

extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    /// Finds the current first responder
    /// - Returns: the current UIResponder if it exists
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func trap() {
        Static.responder = self
    }
}
