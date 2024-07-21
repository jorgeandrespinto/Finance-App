//
//  HomeView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/18/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack{
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(.gray)
                            .padding()
                        Spacer()
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(.gray)
                            .padding()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Net total")
                            .font(.headline)
                            .padding(.leading)
                        Text("this week")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Text(viewModel.expenses.reduce(0) { $0 + (Double($1.amount) ?? 0) }, format: .currency(code: "USD"))
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.gray)
                }
                ZStack {
                    Color.white.ignoresSafeArea(edges: .all)
                    List(viewModel.expenses) { expense in
                        Section(header: Text("TODAY")) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(hex: expense.color))
                                        .frame(width: 50, height: 50, alignment: .center)
                                    Text(expense.emoji)
                                        .font(.system(size: 30))
                                        .padding()
                                }
                                VStack(alignment: .leading) {
                                    Text(expense.note)
                                        .font(.headline)
                                    Text(expense.date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("$\(expense.amount)")
                                    .foregroundColor(expense.isExpense ? .red : .gray)
                            }
                            .listRowBackground(Color(.white))
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .background(Color(.white))
                }
                .background(Color.white)
                Spacer()
                
                HStack {
                    Spacer()
                    Image(systemName: "house.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: Text("Add View")) {
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    NavigationLink(destination: AddExpenseAndIncomeView()) {
                        Image(systemName: "plus.rectangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .foregroundColor(.black)
                    }
                    Spacer()
                    NavigationLink(destination: Text("Add View")) {
                        Image(systemName: "square.grid.2x2.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    NavigationLink(destination: Text("Add View")) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    HomeView()
}
