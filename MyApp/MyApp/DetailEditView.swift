//
//  DetailEditView.swift
//  MyApp
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var product: Product
    @State var data = Product.Data()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
 
    var body: some View {
        VStack {
            Form {
                Section(header: Label("Add / edit item", systemImage: "square.and.pencil")) {
                    TextField("Product Name", text: $data.name)
                }
                Section(header: Label("Add a description", systemImage: "square.and.pencil")) {
                    TextField("Description / Pick-up Address", text: $data.description)
                        .frame(height: 100, alignment: .top)
                }
//                    Section(header: Text("Choose Quantity")){
//                        TextField(String(0), text: $data.quantity)
//                            .frame(width: 100, height: 20)

                    Section() {
                        Picker("Unit", selection: $data.unit) {
                            Text("Kilograms").tag(Unit.kg)
                            Text("Number of items").tag(Unit.number)
                            Text("Pounds").tag(Unit.lbs)
                        }
                        .pickerStyle(.wheel)
                    }
               // Section() {
                 //   StepperView()
               // }
                Section() {
                    Toggle(isOn: $data.makePublic) {
                        Text("Make Public")
                    }
                }
                //NavigationLink(destination: TabBarView()) {
                    Button("Save") {
                        product.update(from: data)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .frame(alignment: .center)
               // }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(product: .constant(Product.sampleData[0]))
    }
}
