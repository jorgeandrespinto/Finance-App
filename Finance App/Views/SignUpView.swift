//
//  SignUpView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/8/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    
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
}

    func signUp() {
        // Implement your sign-up logic here
        print("Signing up with: First Name: \(firstName), Last Name: \(lastName), Email: \(email), Phone: \(phone), Password: \(password)")
        // Example: Validate input, create user account, etc.
    }
}

#Preview {
    SignUpView()
}
