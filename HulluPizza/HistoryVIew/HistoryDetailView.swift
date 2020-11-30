//
//  DetailView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 30/11/20.
//

import SwiftUI

struct HistoryDetailView: View {
    var historyItem: HistoryItem
    @Binding var imageId: Int
    var body: some View {
        imageId = historyItem.id
        return VStack {
            PageTitleView(title: historyItem.name)
                .padding(.bottom)
            Text(historyItem.history)
        }.padding()
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView(historyItem: testHistoryItem, imageId: .constant(0))
    }
}
