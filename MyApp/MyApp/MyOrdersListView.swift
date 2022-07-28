//
//  MyOrdersListView.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import SwiftUI

struct MyOrdersListView: View {
    let orderList: [Order]
    var body: some View {
        VStack {
            Text("My Orders")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            List {
                ForEach(orderList) { order in
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(10)
                        Text("\(order.customerName)'s order")
                            .bold()
                            .padding(.vertical, 13.0)
                        EditButton()
                    }
                }
            }
         }.tabItem { Label("My Produce", systemImage: "list.bullet") }.tag(3)
    }
}

struct MyOrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersListView(orderList: Order.orderSampleData)
    }
}
