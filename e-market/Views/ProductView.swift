//
//  ProductView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct ProductView:View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var rootIsActive : Bool
    
    var body: some View {
        VStack{
            Image("coffee1")
                .resizable()
                .cornerRadius(20)
                .frame(maxWidth: .infinity, maxHeight: 400)
            HStack {
                Text("Coffee Latte")
                    .font(.title)
                    .bold()
                Spacer()
                Text("$20")
                    .font(.subheadline)
            }
            StepperView()
            HStack {
                Button(action:{
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("Add To Cart")
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
                .cornerRadius(10)
                .padding([.leading, .trailing], 10)
                
                Spacer()
                Button(action:{
                    
                }) {
                    NavigationLink(destination: OrderSummaryView(rootIsActive: self.$rootIsActive)) {
                        Text("Buy Now")
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                            .foregroundColor(Color.white)
                            .background(Color.cyan)
                    }
                }
                .cornerRadius(10)
                .padding([.leading, .trailing], 10)
            }
            
            Spacer()
        }
        .padding(20)
    }
}

struct ProductView_Previews: PreviewProvider{
    static var previews: some View {
        ProductView(rootIsActive: .constant(false))
    }
}
