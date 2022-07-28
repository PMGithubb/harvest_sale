//
//  StepperView.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import SwiftUI



struct StepperView: View {
    @State private var data = Product.Data()
    
    func incrementStep() {
        data.quantity += 0.5
    }

    func decrementStep() {
        data.quantity -= 1
        if data.quantity < 0 { data.quantity = 0 }
    }

    var body: some View {
        let quantityText: String = String(format: "%.1f", data.quantity)
        Stepper {
            Text("Quantity: \(quantityText)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .frame(width: 250, alignment: .trailing)
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
