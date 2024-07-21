//
//  HomeViewModel.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/21/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class HomeViewModel: ObservableObject {
    @Published var expenses: [ExpenseIncome] = []
    
    private var db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let userEmail = Auth.auth().currentUser?.email else { return }
        
        db.collection("expenseIncome")
            .whereField("sender", isEqualTo: userEmail)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.expenses = documents.map { queryDocumentSnapshot -> ExpenseIncome in
                    let data = queryDocumentSnapshot.data()
                    let id = queryDocumentSnapshot.documentID
                    let amount = data["amount"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let date = data["date"] as? String ?? ""
                    let isExpense = data["isExpense"] as? Bool ?? true
                    let note = data["note"] as? String ?? ""
                    let sender = data["sender"] as? String ?? ""
                    let color = data["color"] as? String ?? ""
                    let emoji = data["emoji"] as? String ?? ""
                    
                    return ExpenseIncome(id: id, amount: amount, category: category, date: date, isExpense: isExpense, note: note, sender: sender, color: color, emoji: emoji)
                }
            }
    }
}
