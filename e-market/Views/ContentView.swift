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
    @State var results = [Product]()
    @State var storeInfo = Store(name: "", openingTime: "", closingTime: "")
    @StateObject var cartController = CartController()
    @ObservedObject var productViewModel = ProductViewModel()
    @ObservedObject var storeViewModel = StoreViewModel()
    
    var body: some View {
        NavigationView {
            if (results.count == 0) {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(results, id: \.self) { item in
                            ProductCard(product: item).environmentObject(cartController)
                        }
                    }
                }
                .navigationTitle(Text(storeInfo.name))
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
            self.productViewModel.fetchProducts { (results) in
                self.results = results
            }
            self.storeViewModel.fetchStoreInformation { (storeInfo) in
                self.storeInfo = storeInfo
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
