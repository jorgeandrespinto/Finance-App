//
//  SignInView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/8/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var authController = AuthController()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignedIn: Bool = false
    
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
                
                if let errorMessage = authController.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
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
        .navigationDestination(isPresented: $isSignedIn) {
            AddExpenseView()
        }
    }
    func signIn() {
        authController.signIn(email: email, password: password) { success in
            if success {
                print("User signed in successfully")
                isSignedIn = true
                
            } else {
                print("Error signing in user")
            }
        }
    }

}

#Preview {
    SignInView()
}
