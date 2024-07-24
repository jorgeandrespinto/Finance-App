//
//  AddExpenseAndIncomeView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/19/24.
//

import SwiftUI

struct AddExpenseAndIncomeView: View {
    @StateObject private var viewModel = AddExpenseAndIncomeViewModel()
    
    @State private var isExpense: Bool = true
    @State private var amount: String = "0"
    @State private var note: String = ""
    @State private var date: Date = Date()
    @State private var category: String = "Food"
    @State private var emoji: String = "🍔"
    @State private var color: String = "FF5733"

    let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        // Action for cancel button
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Picker("", selection: $isExpense) {
                        Text("Expense").tag(true)
                        Text("Income").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                    Button(action: {
                        // Action for save button
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath.circle")
                            .foregroundColor(.gray)
                    }
                }
                .padding()

                HStack {
                    Text("$\(amount)")
                        .font(.system(size: 50, weight: .bold))
                        .padding()
                    
                    Button(action: {
                        deleteLastDigit()
                    }) {
                        Image(systemName: "delete.left")
                            .foregroundColor(.red)
                            .padding(.trailing)
                    }
                }

                TextField("Add Note", text: $note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                HStack {
                    Button(action: {
                        // Action for date picker
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("\(date, formatter: dateFormatter)")
                                .foregroundColor(.gray)
                            Text("20:20")
                                .foregroundColor(.gray)
                        }
                    }

                    Spacer()

                    Button(action: {
                        // Action for category picker
                    }) {
                        HStack {
                            Image(systemName: "square.grid.2x2")
                            Text("Category")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(1..<10, id: \.self) { number in
                        Button(action: {
                            addNumberToAmount(number: number)
                        }) {
                            NumberPadButton(number: number)
                        }
                    }

                    Button(action: {
                        addDecimalToAmount()
                    }) {
                        NumberPadButton(number: ".")
                    }

                    Button(action: {
                        addNumberToAmount(number: 0)
                    }) {
                        NumberPadButton(number: 0)
                    }

                    Button(action: {
                        // Action for done button
                        saveExpenseIncome()
                    }) {
                        Image(systemName: "checkmark.square")
                            .font(.system(size: 35))
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }

    func addNumberToAmount(number: Int) {
        if amount == "0" {
            amount = "\(number)"
        } else {
            amount.append("\(number)")
        }
    }

    func addDecimalToAmount() {
        if !amount.contains(".") {
            amount.append(".")
        }
    }

    func deleteLastDigit() {
        if !amount.isEmpty {
            amount.removeLast()
            if amount.isEmpty {
                amount = "0"
            }
        }
    }
    
    func saveExpenseIncome() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateString = dateFormatter.string(from: date)
        
        viewModel.saveExpenseIncome(
            amount: amount,
            category: category,
            date: dateString,
            isExpense: isExpense,
            note: note,
            emoji: emoji,
            color: color
        )
    }
}

struct NumberPadButton: View {
    var number: Any
    var body: some View {
        Text("\(number)")
            .font(.system(size: 35))
            .frame(width: 80, height: 80)
            .background(Color.gray.opacity(0.2))
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
}()

#Preview {
    AddExpenseAndIncomeView()
}
