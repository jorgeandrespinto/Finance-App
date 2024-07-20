//
//  AddExpenseAndIncomeViewModel.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/19/24.
//

import Foundation
import Foundation
import FirebaseFirestore
import FirebaseAuth

class AddExpenseAndIncomeViewModel: ObservableObject {
    private let db = Firestore.firestore()

    func saveExpenseIncome(amount: String, category: String, date: String, isExpense: Bool, note: String) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No user is signed in.")
            return
        }

        let sender = currentUser.email ?? "Unknown"
        let newExpenseIncome = ExpenseIncome(amount: amount, category: category, date: date, isExpense: isExpense, note: note, sender: sender)

        do {
            try db.collection("expenseIncome").document(newExpenseIncome.id).setData(from: newExpenseIncome)
            print("Expense/Income successfully added.")
        } catch let error {
            print("Error writing expense/income to Firestore: \(error)")
        }
    }
}
