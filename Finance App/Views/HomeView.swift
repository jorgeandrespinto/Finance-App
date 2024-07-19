//
//  HomeView.swift
//  Finance App
//
//  Created by Jorge Pinto on 7/18/24.
//

import SwiftUI

struct HomeView: View {
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
                    
                    Text("-$7.50")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.gray)
                }
                ZStack {
                    Color.white.ignoresSafeArea(edges: .all)
                    List {
                        Section(header: Text("TODAY")) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.cyan)
                                        .frame(width: 50, height: 50, alignment: .center)
                                    Text("🍔")
                                        .font(.system(size: 30))
                                        .padding()
                                }
                                VStack(alignment: .leading) {
                                    Text("Starbucks Drink")
                                        .font(.headline)
                                    Text("8:20 PM")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("-$7.50")
                                    .foregroundColor(.gray)
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
                    NavigationLink(destination: Text("Add View")) {
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

#Preview {
    HomeView()
}
