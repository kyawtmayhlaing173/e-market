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
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(
                url: URL(string: product.imageUrl),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(width: 70, height: 120)
                },
                placeholder: {
                    ProgressView()
                }
            ).frame(width: 70, height: 120)
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                    .frame(alignment: .leading)
                    .font(.title2)
                Text("$\(product.price)")
                HStack {
                    Button {
                        cartManager.removeFromCart(product: product)
                    } label: {
                        Image(systemName: "minus")
                            .padding(.top, 6)
                            .padding(.bottom, 6)
                            .padding(5)
                            .foregroundColor(Color.white)
                            .background(.blue)
                            .cornerRadius(50)
                    }
                    
                    Text("\(order_count)")
                    
                    Button {
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "plus")
                            .padding(5)
                            .foregroundColor(Color.white)
                            .background(.blue)
                            .cornerRadius(50)
                    }
                    Spacer()
                    Button {
                        cartManager.removeFromCart(product: product)
                    } label: {
                        Image(systemName: "trash")
                            .padding(5)
                            .foregroundColor(Color.black)
                            .background(.white)
                            .cornerRadius(50)
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct OrderSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryCard(order_count: 0, product: Product(name: "", price: 0, imageUrl: "")).environmentObject(CartManager())
    }
}
