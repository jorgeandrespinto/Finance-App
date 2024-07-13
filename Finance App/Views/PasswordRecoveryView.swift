//
//  PasswordRecovery.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/8/24.
//

import SwiftUI

struct PasswordRecovery: View {
    @State private var email: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("LogoImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding()

            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding(.horizontal)

            Button(action: {
                // Action for password recovery button
                recoverPassword()
            }) {
                Text("Recover Password")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .cornerRadius(25)
                    .padding(.horizontal)
            }

            Spacer()
        }
        .padding()
    }

    func recoverPassword() {
        // Implement your password recovery logic here
        print("Recovering password for email: \(email)")
        // Example: Send a password reset email or navigate to confirmation screen
    }
}

#Preview {
    PasswordRecovery()
}
