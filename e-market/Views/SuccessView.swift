//
//  SuccessView.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 27/04/2022.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "checkmark")
                    .padding(3)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(50)
                Text("Checkout complete")
                    .foregroundColor(Color.blue)
            }
            Text("Thank you for choosing us")
                .font(.title)
                .bold()
                .tracking(5)
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            
            Button(action: {
            }, label: {
                NavigationLink(destination: ContentView()) {
                    Text("Go to Home")
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
            })
            .cornerRadius(10)
            .padding([.leading, .trailing], 20)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
