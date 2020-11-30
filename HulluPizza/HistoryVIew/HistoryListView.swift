//
//  HistoryListView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct HistoryListView: View {
    var historyModel = HistoryModel()
    @Binding var imageId: Int
    var body: some View {
        NavigationView{
            List(historyModel.historyItems) { item in
                NavigationLink(
                    destination: HistoryDetailView(historyItem: item, imageId: self.$imageId)){
                    HistoryRowView(historyItem: item)
                }
            }
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView(historyModel: HistoryModel(), imageId: .constant(0))
    }
}
