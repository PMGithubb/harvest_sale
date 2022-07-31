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
                        .lineLimit(/*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
                }
                
                Section() {
                    Image(product.imageName)
                        .resizable()
                        .frame(width: 310, height: 200)
                        .cornerRadius(20)
                }
                
                Section() {
                    Toggle(isOn: $data.makePublic) {
                        Text("Make Public")
                    }
                }
                
                Button(action: {
                    product.update(from: data)
                    self.presentationMode.wrappedValue.dismiss()
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
                .listRowBackground(Color.backgroundYellow)
                
            }
            .background(Color.backgroundYellow)
        }
        .foregroundColor(Color.textBrown)
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(product: .constant(Product.sampleData[0]))
    }
}
