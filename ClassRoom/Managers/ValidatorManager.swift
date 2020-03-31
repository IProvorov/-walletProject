//
//  ValidatorManager.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/24/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

class ValidatorManager {
    var allowedSymbols = "ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
    var loginIsCorrect: Bool = false
    var passwordIsCorrect: Bool = false
func isLoginCorrect(login: String) -> Bool {
        var numberOfPassedSymbols = 0
        if login.count == 0 {
            loginIsCorrect = false
        } else {
            loginIsCorrect = true
            allowedSymbols.forEach { allowedSymbol in
                login.forEach { symbolFromLogin in
                    if symbolFromLogin == allowedSymbol {
                        loginIsCorrect = true
                        numberOfPassedSymbols += 1
                    }
                }
            }
            if numberOfPassedSymbols < login.count {
                loginIsCorrect = false
            }
        }
        return loginIsCorrect
    }
    func isPasswordCorrect(password: String) -> Bool {
        if password.count < 6 {
            passwordIsCorrect = false
        } else {
            passwordIsCorrect = true
        }
        return passwordIsCorrect
    }
}
