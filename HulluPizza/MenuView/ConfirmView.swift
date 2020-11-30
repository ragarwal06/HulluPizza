//
//  ConfirmView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/13/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct ConfirmView: View {
    let sizes: [Size] = [.small, .medium, .large]
    var menuID:Int
    @Binding var isPresented: Bool
    @ObservedObject var orderModel:OrderModel
    @Binding var quantity:Int
    @Binding var size: Size
    @State var comment: String = ""
    ///extracts the menu item name based on `menuID`
    var name:String{
        orderModel.menu(menuID)?.name ?? ""
    }
    
    func addItem(){
        orderModel.add(menuID: menuID, size: size,quantity: quantity, comments: comment)
        isPresented = false
    }
    
    func removeItem(){
        self.isPresented=false
    }
    
    var body: some View {
        VStack{
            Text("Confirm Order")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading)
                .padding(.top)
            Divider()
            SelectedImageView(image: "\(menuID)_250w")
                .padding(20)
                .shadow(color: Color("G6").opacity(0.5), radius: 5, x: 5, y: 10)
//                .onTapGesture(count: 2) {
//                    self.isPresented = false
//                }
                .gesture(
                    TapGesture(count: 2)
                        .onEnded{
                            self.isPresented = false
                        }
                )
//            Divider()
            Text("Confirm your order of \(quantity) \(size.formatted()) \(name) pizza")
                .font(.headline)
            TextField("Add your comment here", text: $comment)
                .background(Color.white)
                .padding()
            VStack {
                Picker(selection: $size, label: Text("Pizza Size")){
                    ForEach(sizes, id:\.self){ size in
                        Text(size.formatted()).tag(size)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Stepper(value: $quantity, in: 1...10){
                    Text("Quantity: \(quantity)")
                        .bold()
                }
            } .padding()
            Spacer()
            HStack {
                Button(action: addItem){
                    Text("Add")
                        .font(.title)
                        .padding([.trailing,.leading], 30)
                        .padding([.top, .bottom], 10)
                    .background(Color("G6"))
                        .foregroundColor(Color("IP2"))
                    .cornerRadius(10)
                }.padding([.bottom])
                Spacer()
                Button(action: removeItem){
                    Text("Cancel")
                        .font(.title)
                        .padding([.trailing,.leading], 20)
                        .padding([.top, .bottom], 10)
                    .background(Color("G6"))
                    .foregroundColor(Color("IP2"))
                    .cornerRadius(10)
                }.padding([.bottom])
            }
            .padding()
        }
        .background(Color("IP2"))
        .foregroundColor(Color("G6"))
        .cornerRadius(20)
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(menuID: 0, isPresented: .constant(true), orderModel: OrderModel(), quantity: .constant(1), size: .constant(.small))
    }
}
