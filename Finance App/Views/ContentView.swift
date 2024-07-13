//
//  ContentView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("BgImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                
                NavigationLink(destination: SignInView()) {
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
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

struct SocialButton: View {
    var icon: String

    var body: some View {
        Button(action: {
            // Action for social button
        }) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .font(.system(size: 30))
                .frame(width: 50, height: 50)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
