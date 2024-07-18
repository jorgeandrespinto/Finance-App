//
//  AuthController.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/17/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthController: ObservableObject {
    @Published var errorMessage: String? = nil

    func signUp(user: UserModel, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                completion(false)
                return
            }
            
            guard let uid = authResult?.user.uid else {
                self.errorMessage = "Failed to get user ID."
                completion(false)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users").document(uid).setData([
                "firstName": user.firstName,
                "lastName": user.lastName,
                "email": user.email,
                "phone": user.phone
            ]) { error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                completion(false)
            } else {
                self.errorMessage = nil
                completion(true)
            }
        }
    }
}
