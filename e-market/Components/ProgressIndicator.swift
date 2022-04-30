//
//  ProgressIndicator.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 30/04/2022.
//

import SwiftUI

struct ProgressIndicator: View {
    var body: some View {
        ProgressView()
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 50
            )
            .background(Color.blue)
    }
}

struct ProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicator()
    }
}
