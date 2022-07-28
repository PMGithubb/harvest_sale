//
//  ContentView.swift
//  MyApp
//
//  Created by CoopStudent on 7/13/22.
//

import SwiftUI

struct MyProduceListView: View {
    @State var data = Product.Data()
    @Binding var productList: [Product]
    var body: some View {
        VStack {
            Text("My Produce")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            List {
                ForEach($productList) { $product in
                    NavigationLink(destination: DetailEditView(product: $product, data: product.data)) {
                        HStack {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 60, height: 50)
                                .cornerRadius(10)
                            Text(product.name)
                                .bold()
                                .padding(.vertical, 13.0)
                            Button("Edit") {
                                data = product.data
                            }
                        }
                    }
                }
            }
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyProduceListView(productList: .constant(Product.sampleData))
    }
}
#endif
