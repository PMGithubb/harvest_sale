//
//  testColor.swift
//  MyApp
//
//  Created by CoopStudent on 7/29/22.
//

import SwiftUI

struct testColor: View {
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct testColor_Previews: PreviewProvider {
    static var previews: some View {
        testColor()
    }
}
