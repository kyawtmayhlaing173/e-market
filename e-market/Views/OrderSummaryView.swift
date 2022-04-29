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
    @State private var username: String = "Kyawt May Hlaing"
    @State private var address: String = "CDC O4 Office, Bangkapi, Bangkok, 10310"
    @State var movetoNextScreen: Int?
    
    var body: some View {
        VStack {
            VStack {
                ScrollView{
                    Text("Cart").bold().font(.title).padding(10)
                    Text("Delivery Detail")
                        .font(.title2)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField(
                        "Name",
                        text: $username
                    )
                        .disableAutocorrection(true)
                        .padding(10)
                    TextField(
                        "Address",
                        text: $address
                    )
                        .disableAutocorrection(true)
                        .padding(10)
                        .padding(.bottom, 20)
                    Text("Your Order")
                        .font(.title2)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if (cartManager.cart.count == 0) {
                        Text("No Order Yet")
                            .font(.title3)
                            .foregroundColor(Color.gray)
                            .padding(30)
                    }
                    ForEach(cartManager.cart, id: \.self) { item in
                        OrderSummaryCard(order_count: item.quantity, product: item.product).environmentObject(cartManager)
                        Divider()
                    }
                }
            }
            .textFieldStyle(.roundedBorder)
            Group {
                HStack {
                    Text("TOTAL").bold().font(.title3)
                    Spacer()
                    Text("$\(cartManager.total)").font(.title2)
                }.padding()
                
                Button(action: {
                    if (username.isEmpty || address.isEmpty || cartManager.cart.count == 0) {
                        movetoNextScreen = 0
                    } else {
                        cartManager.cart = []
                        ProductViewModel().postOrder(order: cartManager.cart, delivery_address: address) { (status) in
                            if status {
                                print("Status Code is", status)
                                movetoNextScreen = 1
                            }
                        }
                        
                    }
                }) {
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
                .cornerRadius(10)
                .padding([.leading, .trailing], 30)
                
            }.background(
                NavigationLink(destination:SuccessView(shouldPopToRootView: self.$rootIsActive),
                               tag: 1, selection: $movetoNextScreen) {EmptyView()}
            )
        }
        Spacer()
    }
}


struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView(rootIsActive: .constant(false)).environmentObject(CartManager())
    }
}
