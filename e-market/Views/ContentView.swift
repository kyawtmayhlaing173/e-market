//
//  ContentView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 26/04/2022.
//

import SwiftUI

struct ContentView: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @State var isActive : Bool = false
    @StateObject var cartController = CartController()
    @ObservedObject var productViewModel = ProductViewModel()
    @ObservedObject var storeViewModel = StoreViewModel()
    
    var body: some View {
        NavigationView {
            if (self.productViewModel.products.count == 0) {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(self.productViewModel.products, id: \.self) { item in
                            ProductCard(product: item).environmentObject(cartController)
                        }
                    }
                }
                .navigationTitle(Text(storeViewModel.storeInfo.name))
                .toolbar {
                    NavigationLink(
                        destination: CartView(rootIsActive: self.$isActive).environmentObject(cartController),
                        isActive: self.$isActive
                    ) {
                        CartButton(numberOfProducts: cartController.cart.map({$0.quantity}).reduce(0, +)
                        )
                    }
                }
            }
        }
        .padding(10)
        .onAppear() {
            self.productViewModel.fetchProducts()
            self.storeViewModel.fetchStoreInformation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
