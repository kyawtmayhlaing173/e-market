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
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(productLists, id: \.self) {
                        product in NavigationLink {
                            ProductView(rootIsActive: self.$isActive)
                        } label: {
                            ProductCard(product: product)
                        }
                    }
                }.padding()
            }
            .navigationTitle(Text("Coffee Shop"))
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
