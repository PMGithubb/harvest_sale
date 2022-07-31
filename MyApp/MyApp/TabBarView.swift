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

    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            VStack {
                MyProduceListView(productList: $products)
            }.tabItem { Label("My Produce", systemImage: "list.bullet") }.tag(1)
            VStack {
                AddProductView(productList: $products)
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
