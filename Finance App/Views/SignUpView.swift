//
//  SignUpView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/8/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var authController = AuthController()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var isSignedUp: Bool = false
    
    var body: some View {
        NavigationStack{
        VStack(spacing: 20) {
            Image("LogoImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding()
            
            VStack(spacing: 20) {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Phone", text: $phone)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            
            Button(action: {
                // Action for sign up button
                signUp()
            }) {
                Text("Sign Up")
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
            
            NavigationLink(destination: SignInView()){
                Text("Sign In")
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
        .navigationDestination(isPresented: $isSignedUp){
            HomeView()
        }
        .navigationBarBackButtonHidden(true)
}

    func signUp() {
        let user = UserModel(firstName: firstName, lastName: lastName, email: email, phone: phone, password: password)
        authController.signUp(user: user) { success in
            if success {
                print("User signed up successfully")
                isSignedUp = true
                // Navigate to another view or show success message
            } else {
                print("Error signing up user")
            }
        }
    }
}

#Preview {
    SignUpView()
}
