//
//  MenuDetailView.swift
//  Pizza
//
//  Created by Steven Lipton on 9/2/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`
struct MenuDetailView: View {
    let sizes: [Size] = [.small, .medium, .large]
    @EnvironmentObject var setting: UserPreferences
    @ObservedObject var orderModel: OrderModel
    @State var didOrder: Bool = false
    @State var quantity:Int = 1
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * setting.size.rawValue)
    }
    func addItem(){
//        orderModel.add(menuID: menuItem.id)
        didOrder = true
    }
    
    
    var body: some View {
        VStack {
            PageTitleView(title: menuItem.name)
            SelectedImageView(image: "\(menuItem.id)_250w")
                .padding(5)
                .layoutPriority(3)
            
            Text(menuItem.description)
                .lineLimit(5)
                .padding()
                .layoutPriority(3)
                
            Spacer()
            Picker(selection: $setting.size, label: Text("Pizza Size")){
                ForEach(sizes, id:\.self){ size in
                    Text(size.formatted()).tag(size)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
//            HStack{
//                Spacer()
//                Text("Pizza size")
//                Text(setting.size.formatted())
//                    .padding(.trailing)
//            }
//            .font(.headline)
            Stepper(value: $quantity, in: 1...10){
                Text("Quantity: \(quantity)")
                    .bold()
            }
//            HStack{
//                Text("Quantity:")
//                Text("1")
//                    .bold()
//                Spacer()
//            }
//            .padding()
            HStack{
                Text("Order:  \(formattedPrice)")
                    .font(.headline)
                Spacer()
                Text("Order total: " + orderModel.formattedTotal )
                    .font(.headline)
            }
            .padding()
            
            HStack{
                Spacer()
                Button(action: addItem) {
                   Text("Add to order")
                    .padding(10)
                    .background(Color("G5"))
                        .foregroundColor(Color("IP"))
                        .cornerRadius(5)
                }
                .sheet(isPresented: $didOrder){
                    ConfirmView(menuID: self.menuItem.id, isPresented: self.$didOrder, orderModel: self.orderModel, quantity: $quantity, size: self.$setting.size)
                }
                Spacer()
            }
            .padding(.top)
            Spacer()
        }
        
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel: OrderModel(), menuItem: testMenuItem)
    }
}
