//
//  ExpenseIncome.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/19/24.
//

import Foundation

struct ExpenseIncome: Identifiable, Encodable {
    var id: String = UUID().uuidString
        var amount: String
        var category: String
        var date: String
        var isExpense: Bool
        var note: String
        var sender: String
        var color: String
        var emoji: String
}
