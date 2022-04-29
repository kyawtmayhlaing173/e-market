//
//  CartButton.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.all, 5)
            if (numberOfProducts > 0) {
                Text("\(numberOfProducts)")
                    .bold()
                    .font(.caption)
                    .padding(3)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(50)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View{
        CartButton(numberOfProducts: 1)
    }
}
