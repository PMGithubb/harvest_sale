//
//  MyOrders.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import Foundation

struct OrderItem: Identifiable {
    let id: UUID
    var productID: UUID
    var orderID: UUID
    var quantity: Double
    
    init(id:UUID = UUID(), productID: UUID, orderID: UUID, quantity: Double) {
        self.id = id
        self.productID = productID
        self.orderID = orderID
        self.quantity = quantity
    }
}

struct Order: Identifiable {
    let id: UUID
    var customerName: String
    var customerDetails: String
    var isComplete: Bool
    
    init(id: UUID = UUID(), customerName: String, customerDetails: String, isComplete: Bool) {
        self.id = id
        self.customerName = customerName
        self.customerDetails = customerDetails
        self.isComplete = isComplete
    }
}

#if DEBUG
extension Order {
    static var orderSampleData = [
        Order(customerName: "Sammy", customerDetails: "sammy@gmail.com", isComplete: false),
        Order(customerName: "Sara Smith", customerDetails: "sara.smith@gmail.com", isComplete: false)
    ]
}
#endif

#if DEBUG
extension OrderItem {
    static var orderItemSampleData = [
        OrderItem(productID: Product.sampleData[0].id, orderID: Order.orderSampleData[0].id, quantity: 5),
        OrderItem(productID: Product.sampleData[4].id, orderID: Order.orderSampleData[1].id, quantity: 4),
        OrderItem(productID: Product.sampleData[2].id, orderID: Order.orderSampleData[1].id, quantity: 1.5),
        OrderItem(productID: Product.sampleData[5].id, orderID: Order.orderSampleData[0].id, quantity: 1)
    ]
}
#endif
