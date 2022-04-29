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
    let product: Product
    
    var body: some View {
        VStack{
            AsyncImage(
                url: URL(string: product.imageUrl),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(20)
                },
                placeholder: {
                    ProgressView()
                }
            )
                .frame(maxWidth: .infinity, maxHeight: 400)
                .padding(.bottom, 30)
            HStack {
                Text(product.name)
                    .font(.title)
                    .bold()
                Spacer()
                Text("\(product.price)$")
                    .font(.subheadline)
            }
//            StepperView(quantity: 0)
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
        ProductView(rootIsActive: .constant(false), product: Product(name: "", price: 0, imageUrl: ""))
    }
}
