//
//  MyProduce.swift
//  MyApp
//
//  Created by CoopStudent on 7/26/22.
//

import Foundation
import UIKit
import SwiftUI

enum Unit {
    case number, kg, g, lbs
}

enum PickUpBy {
    case today, tomorrow, day_after
}

struct Product: Identifiable {
    var name: String
    var description: String
    var makePublic: Bool
    var quantity: Double
    var unit: Unit?
    var price: Double?
    var pickUpBy: PickUpBy?
    var imageName: String
    let id: UUID
    
    init(id: UUID = UUID(), name: String, description: String, makePublic: Bool, quantity: Double, unit: Unit?, price: Double?, pickUpBy: PickUpBy?, imageName: String) {
        self.id = id
        self.name = name
        self.description = description
        self.makePublic = makePublic
        self.quantity = quantity
        self.unit = unit
        self.price = price
        self.pickUpBy = pickUpBy
        self.imageName = imageName
    }
    
    struct Data {
        var name: String = ""
        var description: String = ""
        var makePublic: Bool = false
        var quantity: Double = 0
        var unit: Unit? = .number
        var price: Double? = 0
        var pickUpBy: PickUpBy? = .today
        var imageName: String = ""
    }
    
    var data: Data {
        Data(name: name, description: description, makePublic: makePublic, quantity: quantity, unit: unit, price: price, pickUpBy: pickUpBy, imageName: imageName)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        description = data.description
        makePublic = data.makePublic
        quantity = data.quantity
        unit = data.unit
        price = data.price
        pickUpBy = data.pickUpBy
        imageName = data.imageName
    }
}

#if DEBUG
extension Product {
    static var sampleData = [
        Product(name: "Tomato", description: "Pick-up at 123 York Street", makePublic: true, quantity: 10, unit: .number, price: 2.05, pickUpBy: .today, imageName: "Tomato"),
        Product(name: "Cucumber", description: "Small cucumbers. Pick-up at 234 York Street", makePublic: false, quantity: 2.5, unit: .number, price: 5, pickUpBy: .tomorrow, imageName: "Cucumber"),
        Product(name: "Zucchini", description: "Large and small both available. Pick-up at 345 York Street", makePublic: true, quantity: 2, unit: .kg, price: 10.50, pickUpBy: .day_after, imageName: "Zucchini"),
        Product(name: "Carrot", description: "Baby carrots, sweet. Pick-up at 456 York Street", makePublic: true, quantity: 8.6, unit: .g, price: 20.99, pickUpBy: .tomorrow, imageName: "Carrot"),
        Product(name: "Green Chillies", description: "Very spicy, small chillies. 567 York Street", makePublic: false, quantity: 11.25, unit: .kg, price: 11, pickUpBy: .today, imageName: "Green Chillies"),
        Product(name: "Potatoes", description: "small. 678 York Street", makePublic: true, quantity: 5, unit: .lbs, price: 2.25, pickUpBy: .day_after, imageName: "Potatoes"),
        Product(name: "apples", description: "sweet, red apples. 789 York Street", makePublic: true, quantity: 4, unit: .number, price: 5.25, pickUpBy: .tomorrow, imageName: "apples")]
}
#endif

extension Product {
    static func retrieveNamefromID(productId: UUID) -> String {
        let product = Product.sampleData.first(where: {$0.id == productId})
        return product?.name ?? ""
    }
}
