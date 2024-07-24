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
                    
                    let netTotal = viewModel.groupedExpenses.flatMap { $0.value }
                        .reduce(0.0) { $0 + (Double($1.amount) ?? 0.0) * ($1.isExpense ? -1 : 1) }
                    
                    Text(String(format: "$%.2f", netTotal))
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(netTotal < 0 ? .red : .blue)
                }
                
                ZStack {
                    Color.white.ignoresSafeArea(edges: .all)
                    List {
                        ForEach(viewModel.sortedKeys, id: \.self) { key in
                            Section(header: Text(key)) {
                                ForEach(viewModel.groupedExpenses[key]!) { expense in
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
                                            Text(self.extractTime(from: expense.date))
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Text(String(format: "$%.2f", Double(expense.amount) ?? 0.00))
                                            .foregroundColor(expense.isExpense ? .red : .gray)
                                    }
                                    .listRowBackground(Color(.white))
                                }
                            }
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
        .navigationBarBackButtonHidden(true)
    }
    
    private func extractTime(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else { return dateString }
        
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
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
