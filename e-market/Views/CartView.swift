//
//  CartView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct CartView: View {
    @Binding var rootIsActive : Bool
    @EnvironmentObject var cartController: CartController
    @State private var address: String = "CDC O4 Office, Bangkapi, Bangkok, 10310"
    @State var movetoNextScreen: Int?
    @ObservedObject var productViewModel = ProductViewModel()
    @State private var isLoading = false
    
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
                    if (cartController.cart.count == 0) {
                        Text("No Order Yet")
                            .font(.title3)
                            .foregroundColor(Color.gray)
                            .padding(30)
                    }
                    ForEach(cartController.cart, id: \.self) { item in
                        CartProductCard(order_count: item.quantity, product: item.product).environmentObject(cartController)
                        Divider()
                    }
                }
            }
            .textFieldStyle(.roundedBorder)
            Group {
                HStack {
                    Text("TOTAL").bold().font(.title3)
                    Spacer()
                    Text("$\(cartController.total)").font(.title2)
                }.padding()
                
                Button(action: {
                    self.isLoading = true
                    if (address.isEmpty || cartController.cart.count == 0) {
                        self.isLoading = false
                        movetoNextScreen = 0
                    } else {
                        cartController.clearCart()
                        self.productViewModel.postOrder(order: cartController.cart, delivery_address: address) { (status) in
                            if status {
                                movetoNextScreen = 1
                            } else {
                                movetoNextScreen = 0
                            }
                        }
                        
                    }
                }) {
                    if (isLoading == true) {
                        ProgressIndicator()
                    } else {
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


struct CartViewView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(rootIsActive: .constant(false)).environmentObject(CartController())
    }
}
