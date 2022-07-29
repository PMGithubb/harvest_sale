//
//  MyOrdersListView.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import SwiftUI

struct MyOrdersListView: View {
    @State var data = Order.Data()
    @Binding var orderList: [Order]
    @Binding var showCompletedOrders: Bool
    var body: some View {
        VStack {
            
            List {
                ForEach($orderList) { $order in
                    if order.isComplete == showCompletedOrders {
                        NavigationLink(destination: UpdateOrderView(order: $order, data: order.data)) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("\(order.customerName)'s order")
                                    .bold()
                                    .padding(.vertical, 13.0)
                                Button("Edit") {
                                    data = order.data
                                }
                            }
                        }
                    }
                }
            }
         }
    }
}

struct MyOrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersListView(orderList: .constant(Order.orderSampleData), showCompletedOrders: .constant(false))
    }
}
