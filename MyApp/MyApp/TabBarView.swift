//
//  TabBarView.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import SwiftUI

struct TabBarView: View {
    @State var products = Product.sampleData
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            VStack {
                MyProduceListView(productList: $products)
            }.tabItem { Label("My Produce", systemImage: "list.bullet") }.tag(1)
            VStack {
               // DetailEditView(product: $products[0])
            } .tabItem { Label("Add item", systemImage: "square.and.pencil") }.tag(2)
            VStack {
                MyOrdersListView(orderList: Order.orderSampleData)
            } .tabItem { Label("My Orders", systemImage: "list.bullet.below.rectangle") }.tag(3)
        }
        
    }
        
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

/* TO DO-
 6. make Quantity, price, unit, pickUpBy, makePublic functionable
 5. image upload
 4. add new product (append to array)
 2. update order page (buttons: confirm/reject order, etc), order details
 3. segmented view: pending & completed orders
 
 7. login page
 */
