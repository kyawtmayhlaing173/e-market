//
//  OrderSummaryView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct OrderSummaryView: View {
    @Binding var rootIsActive : Bool
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            VStack {
                ScrollView{
                    Text("Your Order").bold().font(.title)
                    ForEach(cartManager.cart, id: \.self) { item in
                        OrderSummaryCard(order_count: item.quantity, product: item.product).environmentObject(cartManager)
                        Divider()
                    }
                }
            }
            Group {
                HStack {
                    Text("TOTAL").bold().font(.title3)
                    Spacer()
                    Text("$\(cartManager.total)").font(.title2)
                }.padding()
                Button(action: {
                }, label: {
                    NavigationLink(destination:SuccessView(shouldPopToRootView: self.$rootIsActive)) {
                        Text("Checkout")
                            .bold()
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: 50
                            )
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                    }
                })
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 30)
            }
            Spacer()
        }
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView(rootIsActive: .constant(false)).environmentObject(CartManager())
    }
}
