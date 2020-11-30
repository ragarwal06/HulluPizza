//
//  HistoryRowView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct HistoryRowView: View {
    var historyItem: HistoryItem
    var body: some View {
        HStack(alignment: .top) {
            Image("\(historyItem.id)_100w")
                .cornerRadius(10)
            .shadow(color: Color("G6").opacity(0.5), radius: 5, x: 5, y: 10)
            Text(historyItem.name)
            Spacer()
        }.overlay(
            Image(systemName: "chevron.right.square")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("G4"))
                ,
            alignment: .trailing
        )
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView(historyItem: testHistoryItem)
    }
}
