//
//  UpdateOrderView.swift
//  MyApp
//
//  Created by CoopStudent on 7/27/22.
//

import SwiftUI

struct UpdateOrderView: View {
    @Binding var order: Order
    @State var data = Order.Data()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.backgroundYellow
                .ignoresSafeArea()
            
        VStack {
            Text("Order Details")
                .font(.title)
                .bold()
                .padding(.bottom)
                .foregroundColor(.titleBrown)
            HStack {
                VStack (alignment: .leading){
                    Text("Customer Details:")
                        .font(.body)
                        .bold()
                    Text("Name: \(order.customerName)")
                        .font(.body)
                        //.padding()
                    Text("Contact: \(order.customerDetails)")
                        .font(.body)
                        //.padding()
                    Text("Items Ordered:")
                        .font(.body)
                        .bold()
                        .padding(.top)
                    ForEach(order.orderItems()) { item in
                        let quantity = item.quantity
                        let quantityText: String = String(format: "%.1f", quantity)
                        let product = Product.retrieveNamefromID(productId: item.productID)
                        Text("- \(product) : \(quantityText)")
                            .font(.body)
                            //.padding()
                    }
                }.padding()
            }
            .padding()
            .background(Color(hue: 0.299, saturation: 0.12, brightness: 0.997))
            .cornerRadius(20)
            
            Text("Update Order")
                .font(.title)
                .bold()
                .padding(.top)
                .foregroundColor(.titleBrown)
            
            HStack {
            HStack {
                VStack {
                    Toggle(isOn: $data.isConfirmed, label: {
                        Text("Accept Order")
                            .bold()
                    })
                        .disabled(data.isRejected == true)
                    
                    Toggle(isOn: $data.isRejected, label: {
                        Text("Decline Order")
                            .bold()
                    })
                    .disabled(data.isConfirmed == true)
                    
                    Toggle(isOn: $data.setReminderOn, label: {
                        Image(systemName: "bell")
                            .font(.system(.title3).bold())
                        Text("Set pick-up reminder")
                            .bold()
                    })
                    
                    Toggle(isOn: $data.isComplete, label: {
                        Image(systemName: "checkmark")
                            .font(.system(.title3).bold())
                        Text("Pick-up Finished")
                            .bold()
                    })
                }
            }
            .padding()
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 50/255, green: 50/255, blue: 50/255, opacity: 0.1), lineWidth: 3)).background(Color(hue: 0.299, saturation: 0.12, brightness: 0.997)).cornerRadius(10)
            }.padding()
            
//
//            Button("Update") {
//                order.update(from: data)
//                self.presentationMode.wrappedValue.dismiss()
//            }
//            .buttonStyle(.bordered)
//            .background(Color(hue: 0.292, saturation: 0.284, brightness: 1.0))
//            .cornerRadius(15)
//            .shadow(color: Color(hue: 0.315, saturation: 0.651, brightness: 0.531), radius: 5)
//            .buttonBorderShape(.roundedRectangle)
//            .padding()
//            .foregroundColor(.black)
            
            HStack {
            Button(action: {
                order.update(from: data)
                self.presentationMode.wrappedValue.dismiss()
            })
            {
                HStack{
                    Spacer()
                    Text("Update")
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
            }.padding()
        }
        .foregroundColor(.textBrown)
        }
    }
}

struct UpdateOrderView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateOrderView(order: .constant(Order.orderSampleData[0]))
    }
}
