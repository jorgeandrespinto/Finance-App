//
//  SignInView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/8/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("LogoImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding()
                
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    HStack{
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Button(action: {
                            // Action for social button
                        }) {
                            Image(systemName: "eye")
                                .foregroundColor(.green)
                        }
                    }
                    HStack {
                        NavigationLink(destination: PasswordRecovery()){
                            Text("Forgot Password?")
                                .foregroundColor(.green)
                                .font(.system(size: 14))
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Action for sign in button
                    signIn()
                }) {
                    Text("Sign In")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                
                HStack(spacing: 20) {
                    SocialButton(icon: "g.circle.fill")
                    SocialButton(icon: "f.circle.fill")
                    SocialButton(icon: "applelogo")
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white)
                        .foregroundColor(.green)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
    func signIn() {
        // Implement your sign-in logic here
        print("Signing in with email: \(email) and password: \(password)")
        // Example: You can validate credentials here or perform authentication
    }
    
    func forgotPassword() {
        // Implement your forgot password logic here
        print("Forgot password tapped")
        // Example: Show a forgot password dialog or navigate to another screen
    }
    
    func signUp() {
        // Implement your sign-up logic here
        print("Sign Up tapped")
        // Example: Navigate to the sign-up screen
    }

}

#Preview {
    SignInView()
}
