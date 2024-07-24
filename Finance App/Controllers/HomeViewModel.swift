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
    @Published var groupedExpenses: [String: [ExpenseIncome]] = [:]
    
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
                
                let expenses = documents.map { queryDocumentSnapshot -> ExpenseIncome in
                    let data = queryDocumentSnapshot.data()
                    let id = queryDocumentSnapshot.documentID
                    let amount = data["amount"] as? String ?? "0.00"
                    let category = data["category"] as? String ?? ""
                    let date = data["date"] as? String ?? ""
                    let isExpense = data["isExpense"] as? Bool ?? true
                    let note = data["note"] as? String ?? ""
                    let sender = data["sender"] as? String ?? ""
                    let color = data["color"] as? String ?? "#FFFFFF"
                    let emoji = data["emoji"] as? String ?? ""
                    
                    return ExpenseIncome(id: id, amount: amount, category: category, date: date, isExpense: isExpense, note: note, sender: sender, color: color, emoji: emoji)
                }
                
                self.groupedExpenses = Dictionary(grouping: expenses, by: { self.formatDate($0.date) })
            }
    }
    
    private func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else { return dateString }
        
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            dateFormatter.dateFormat = "EEEE, d MMMM"
            return dateFormatter.string(from: date)
        }
    }
    
    private func extractDay(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else { return dateString }
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    var sortedKeys: [String] {
        return groupedExpenses.keys.sorted(by: { $0 > $1 })
    }
}
