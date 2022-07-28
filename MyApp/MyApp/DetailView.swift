//
//  DetailView.swift
//  MyApp
//
//  Created by CoopStudent on 7/26/22.
//

import SwiftUI

struct DetailView: View {
    let product: Product
    var body: some View {
        VStack {
            Text(product.name)
            Text(product.description)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(product: Product.sampleData[0])
        }
    }
}
