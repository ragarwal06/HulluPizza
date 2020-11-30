//
//  PageTitleView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct PageTitleView: View {
    var title: String
    var isDisplayingOrders: Bool? = nil
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.trailing)
            
        }.overlay(
            Image(systemName:  "chevron.up.square")
                .rotationEffect(isDisplayingOrders ?? false ? Angle(degrees: 0): Angle(degrees: 180.0))
                .animation(.easeInOut(duration: 0.5))
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(isDisplayingOrders != nil ? Color("G2") : .clear)
                .padding(),
            alignment: .leading
        )
        .foregroundColor(Color("G2"))
        .background(Color("G5"))
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Order Pizza", isDisplayingOrders: true)
    }
}
