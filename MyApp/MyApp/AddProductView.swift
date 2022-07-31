//
//  AddProductView.swift
//  MyApp
//
//  Created by CoopStudent on 7/28/22.
//

import SwiftUI

struct AddProductView: View {
    @Binding var productList: Array<Product>
    //@Binding var product: Product
    @State var data = Product.Data()
    @State private var showAlert = false
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
 
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

            Section() {
                Picker("Image", selection: $data.imageName) {
                    Image("Tomato").tag("Tomato")
                    Image("Cucumber").tag("Cucumber")
                    Image("apples").tag("apples")
                    Image("Potatoes").tag("Potatoes")
                    Image("Carrot").tag("Carrot")
                    Image("Grapes").tag("Grapes")
                }
                .frame(height: 60)
                .scaledToFit()
                .pickerStyle(SegmentedPickerStyle())
            }
                
                Section() {
                    Toggle(isOn: $data.makePublic) {
                        Text("Make Public")
                    }
                }
                
                Button(action: {
                    var product = Product(name: "", description: "", makePublic: false, quantity: 0, unit: .kg, price: 10, pickUpBy: .day_after, imageName: "")
                    product.update(from: data)
                    productList.append(product)
                    data.name = ""
                    data.description = ""
                    data.imageName = ""
                    showAlert = true
                    //self.presentationMode.wrappedValue.dismiss()
                })
                {
                    HStack{
                        Spacer()
                        Text("Save")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .background(Color.forestGreen)
                    .cornerRadius(5)
                    .shadow(color: Color(hue: 0.315, saturation: 0.651, brightness: 0.531), radius: 2.5)
                    .buttonBorderShape(.roundedRectangle)
                    .font(.system(.title3))
                }
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Successfully saved!"), message: Text("Your product has been added"), dismissButton: .default(Text("Ok")))
                }
                .listRowBackground(Color.backgroundYellow)
            }
            .background(Color.backgroundYellow)
            
        }
        .foregroundColor(Color.textBrown)
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(productList: .constant(Product.sampleData))
    }
}
