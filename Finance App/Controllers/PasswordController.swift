//
//  PasswordController.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/23/24.
//

import Foundation
import SwiftUI

class PasswordController {
    private var model: PasswordModel
    
    init(model: PasswordModel) {
        self.model = model
    }
    
    func togglePasswordVisibility() {
        model.isPasswordVisible.toggle()
    }
}
