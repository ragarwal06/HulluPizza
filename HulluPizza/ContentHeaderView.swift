//
//  ContentHeaderView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        VStack{
            HStack{
                Image("Pizza")
                    .shadow(color: Color("G6").opacity(0.5), radius: 5, x: 5, y: 10)
                Text("Hullu Pizza Company")
                    .offset(x: 10)
                    .font(Font.custom("Avinir-Black", size: 20))
            }
        }
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}
