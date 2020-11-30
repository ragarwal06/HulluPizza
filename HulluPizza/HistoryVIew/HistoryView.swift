//
//  HistoryView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct HistoryView: View {
    @State var imageId: Int = 0
    var body: some View {
        VStack {
            ContentHeaderView()
            PageTitleView(title: "Pizza History")
            SelectedImageView(image: "\(imageId)_250w")
                .padding(5)
                .shadow(color: Color("G6").opacity(0.5), radius: 5, x: 5, y: 10)
            HistoryListView(imageId: $imageId)
        }
        .padding()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HistoryView()
            HistoryView()
                .colorScheme(.dark)
                .background(Color.black)
        }
    }
}
