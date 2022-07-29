//
//  TabBarView.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import SwiftUI

struct TabBarView: View {
    @State var products = Product.sampleData
    @State var orders = Order.orderSampleData
    @State var product = Product(name: "", description: "", makePublic: false, quantity: 0, unit: .kg, price: 10, pickUpBy: .day_after, imageName: "")
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            VStack {
                MyProduceListView(productList: $products)
            }.tabItem { Label("My Produce", systemImage: "list.bullet") }.tag(1)
            VStack {
                AddProductView(productList: $products, product: $product, data: product.data)
            } .tabItem { Label("Add item", systemImage: "square.and.pencil") }.tag(2)
            VStack {
                SegmentedControlView(orderList: $orders)
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
  
 SET MY ORDERS VIEW AS DEFAULT FOR UPDATE ORDER VIEW
 
 */
