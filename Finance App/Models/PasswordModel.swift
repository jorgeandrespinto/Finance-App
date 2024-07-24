//
//  PasswordModel.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/23/24.
//

import Foundation
import SwiftUI

class PasswordModel: ObservableObject {
    @Published var password: String = ""
    @Published var isPasswordVisible: Bool = false
}
