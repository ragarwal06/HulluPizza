//
//  OrderListView.swift
//  HulluPizza
//
//  Created by Rahul Agarwal on 29/11/20.
//

import SwiftUI

struct OrderListView: View {
    var orderModel: OrderModel
    var body: some View {
        VStack {
            List{
                Section(
                    header: ListHeaderView(orderModel: self.orderModel, text: "Your Order(s)")
                ){
                    ForEach(orderModel.orders){ item in
                        OrderRowView(orderItem: item)
                    }
                    .onDelete(perform: delete)
                }
                
            }
        }
    }
    func delete(at offsets: IndexSet){
        orderModel.orders.remove(atOffsets: offsets)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel())
    }
}


