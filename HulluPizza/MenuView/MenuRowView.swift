//
//  MenuRowView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct MenuRowView: View {
    var item: MenuItem = testMenuItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 15) {
                Image("\(item.id)_100w")
                    .cornerRadius(10)
                    .shadow(color: Color("G6").opacity(0.5), radius: 5, x: 5, y: 10)
                VStack(alignment: .leading) {
                    Text(item.name)
                        .fontWeight(.light)
                    RatingsView(count: item.rating)
                }
                Spacer()
            }
            Text(item.description)
        }
    }
}


struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(item: MenuModel().menu[0])
    }
}

