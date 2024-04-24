//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation
import SwiftUI

final class LoginViewViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var nameIsValid = false
    var name = "" {
        didSet {
            if name.count >= 3 {
                nameIsValid = true
            } else {
                nameIsValid = false
            }
        }
    }
}
