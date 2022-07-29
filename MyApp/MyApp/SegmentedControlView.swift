//
//  SegmentedControlView.swift
//  MyApp
//
//  Created by CoopStudent on 7/28/22.
//

import SwiftUI

struct SegmentedControlView: View {
    @State private var selectedValue: Bool = false
    @Binding var orderList: [Order]
    var body: some View {
        VStack {
            Text("My Orders")
                .font(.largeTitle)
                .bold()
                //.padding(.top)
            Picker("My Orders", selection: $selectedValue, content: {
                Text("Pending Orders").tag(false)
                Text("Completed Orders").tag(true)
            })
            .pickerStyle(SegmentedPickerStyle()
                ) // <1>
                MyOrdersListView(orderList: $orderList, showCompletedOrders: $selectedValue)
                //.background(.pink)
            
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(orderList: .constant(Order.orderSampleData))
    }
}
