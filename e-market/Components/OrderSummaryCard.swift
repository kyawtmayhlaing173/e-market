//
//  OrderSummaryCard.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct OrderSummaryCard: View {
    var order_count: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Image("coffee1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text("Latte")
                    .bold()
                Text("$\(50)")
            }
            Spacer()
            StepperView()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct OrderSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryCard(order_count: 0)
    }
}
