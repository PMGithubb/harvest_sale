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
        ZStack {
            Color.backgroundYellow
                .ignoresSafeArea()
            VStack {
                Text("My Orders")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.titleBrown)
                    //.padding(.top)
                Picker("My Orders", selection: $selectedValue, content: {
                    Text("Pending Orders").tag(false)
                    Text("Completed Orders").tag(true)
                })
                .frame(height: 20)
                .pickerStyle(SegmentedPickerStyle()
                    ) // <1>
                    MyOrdersListView(orderList: $orderList, showCompletedOrders: $selectedValue)
                    Color.backgroundYellow
                    .ignoresSafeArea()
                //.background(.pink)
                
            }
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(orderList: .constant(Order.orderSampleData))
    }
}
