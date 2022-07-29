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
    var isConfirmed: Bool
    var setReminderOn: Bool
    var isRejected: Bool
    
    init(id: UUID = UUID(), customerName: String, customerDetails: String, isComplete: Bool, isConfirmed: Bool, setReminderOn: Bool, isRejected: Bool) {
        self.id = id
        self.customerName = customerName
        self.customerDetails = customerDetails
        self.isComplete = isComplete
        self.isConfirmed = isConfirmed
        self.setReminderOn = setReminderOn
        self.isRejected = isRejected
    }
    
    struct Data {
        var isComplete: Bool = false
        var isConfirmed: Bool = false
        var setReminderOn: Bool = false
        var isRejected: Bool = false
    }
    
    var data: Data {
        Data(isComplete: isComplete, isConfirmed: isConfirmed, setReminderOn: setReminderOn, isRejected: isRejected)
    }
    
    mutating func update(from data: Data) {
        isComplete = data.isComplete
        isConfirmed = data.isConfirmed
        setReminderOn = data.setReminderOn
        isRejected = data.isRejected
    }
}

#if DEBUG
extension Order {
    static var orderSampleData = [
        Order(customerName: "Sammy", customerDetails: "sammy@gmail.com", isComplete: false, isConfirmed: false, setReminderOn: false, isRejected: false),
        Order(customerName: "Sara Smith", customerDetails: "sara.smith@gmail.com", isComplete: false, isConfirmed: false, setReminderOn: false, isRejected: false)
    ]
}
#endif

#if DEBUG
extension OrderItem {
    static var orderItemSampleData = [
        OrderItem(productID: Product.sampleData[0].id, orderID: Order.orderSampleData[0].id, quantity: 5),
        OrderItem(productID: Product.sampleData[4].id, orderID: Order.orderSampleData[1].id, quantity: 4),
        OrderItem(productID: Product.sampleData[2].id, orderID: Order.orderSampleData[1].id, quantity: 1.5),
        OrderItem(productID: Product.sampleData[5].id, orderID: Order.orderSampleData[0].id, quantity: 1),
        OrderItem(productID: Product.sampleData[1].id, orderID: Order.orderSampleData[0].id, quantity: 2.5),
        OrderItem(productID: Product.sampleData[3].id, orderID: Order.orderSampleData[0].id, quantity: 5.5),
        OrderItem(productID: Product.sampleData[5].id, orderID: Order.orderSampleData[1].id, quantity: 1),
        OrderItem(productID: Product.sampleData[6].id, orderID: Order.orderSampleData[0].id, quantity: 2),
        OrderItem(productID: Product.sampleData[3].id, orderID: Order.orderSampleData[1].id, quantity: 3),
        OrderItem(productID: Product.sampleData[6].id, orderID: Order.orderSampleData[1].id, quantity: 3.5)
    ]
    
}
#endif

extension Order {
    func orderItems() -> Array<OrderItem> {
        let items = OrderItem.orderItemSampleData.filter{$0.orderID == self.id}
        return items
    }
}
