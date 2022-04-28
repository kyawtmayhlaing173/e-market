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
    @State var isLoading: Bool = true
    @State var storeInfo = Store(name: "", openingTime: "", closingTime: "")
    
    var body: some View {
        NavigationView {
            if (results.count == 0) {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(results, id: \.self) { item in
                            NavigationLink {
                                ProductView(rootIsActive: self.$isActive)
                            } label: {
                                ProductCard(product: item)
                            }
                        }
                    }
                }
                .navigationTitle(Text(storeInfo.name))
                .toolbar {
                    NavigationLink(
                        destination: OrderSummaryView(rootIsActive: self.$isActive),
                        isActive: self.$isActive
                    ) {
                        CartButton(numberOfProducts: 1)
                    }
                }
            }
        }
        .padding(10)
        .onAppear() {
            ProductViewModel().fetchProducts { (results) in
                self.results = results
            }
            StoreViewModel().fetchStoreInformation { (storeInfo) in
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
