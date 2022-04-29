//
//  DeliveryDetailView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 29/04/2022.
//

import SwiftUI

struct DeliveryDetailView: View {
    @Binding var rootIsActive : Bool
    @State private var username: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var zip: String = ""
    
    var body: some View {
        VStack {
            Text("Delivery Details").font(.title)
            TextField(
                "Name",
                text: $username
            )
                .disableAutocorrection(true)
                .padding(5)
            Text(username)
            TextField(
                "Address",
                text: $address
            )
                .disableAutocorrection(true)
                .padding(5)
            TextField(
                "City",
                text: $city
            )
                .disableAutocorrection(true)
                .padding(5)
            TextField(
                "Zip",
                text: $zip
            )
                .disableAutocorrection(true)
                .padding(5)
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

struct DeliveryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailView(rootIsActive: .constant(false))
    }
}
