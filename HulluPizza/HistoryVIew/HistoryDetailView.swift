//
//  DetailView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 30/11/20.
//

import SwiftUI

struct HistoryDetailView: View {
    @State var isPresented:Bool = false
    var historyItem: HistoryItem
    @Binding var imageId: Int
    var body: some View {
        imageId = historyItem.id
        return VStack {
            PageTitleView(title: historyItem.name)
            MapView(latitude: historyItem.latitude, longitude: historyItem.longitude, regionRadius: 1000000)
                .frame(height: 100)
            PresentMapButton(isPresented: $isPresented, historyItem: historyItem)
            Text(historyItem.history)
        }
        
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView(historyItem: testHistoryItem, imageId: .constant(0))
    }
}
