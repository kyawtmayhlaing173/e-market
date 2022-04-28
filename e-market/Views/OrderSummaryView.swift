//
//  OrderSummaryView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct OrderSummaryView: View {
    @Binding var rootIsActive : Bool
    
    var body: some View {
        VStack {
            ScrollView{
                Text("Your Order").bold().font(.title)
                OrderSummaryCard(order_count: 1)
                OrderSummaryCard(order_count: 2)
                OrderSummaryCard(order_count: 4)
            }
            Group {
                Button(action: {
                    print("Floating Button Click")
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
        OrderSummaryView(rootIsActive: .constant(false))
    }
}
