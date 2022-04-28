//
//  OrderSummaryCard.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct OrderSummaryCard: View {
    var order_count: Int
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(
                url: URL(string: product.imageUrl),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70)
                        .cornerRadius(20)
                },
                placeholder: {
                    ProgressView()
                }
            ).frame(width: 70)
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold().frame(width: 60, alignment: .leading)
                Text("$\(product.price)")
            }
            Spacer()
            StepperView(quantity: order_count)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct OrderSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryCard(order_count: 0, product: Product(name: "", price: 0, imageUrl: ""))
    }
}
