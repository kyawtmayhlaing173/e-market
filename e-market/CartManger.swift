//
//  CartManger.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cart: [ProductOrder] = []
    @Published var total: Int = 0
    
    func addToCart(product: Product) {
        if cart.count == 0 {
            cart.append(ProductOrder(product: product, quantity: 1))
        } else {
            let result = cart.filter{$0.product == product}
            if (result.count > 0) {
                let quantity = result[0].quantity + 1
                let newProduct = ProductOrder(product: product, quantity: quantity)
                cart = cart.map { $0.product == product ? newProduct: $0 }
            } else {
                cart.append(ProductOrder(product: product, quantity: 1))
            }
        }
        total += product.price
    }
    
    func decreaseProductCount(product: Product) {
        let result = cart.filter{$0.product == product}
        if (result.count > 0) {
            let quantity = result[0].quantity - 1
            let newProduct = ProductOrder(product: product, quantity: quantity)
            cart = cart.map { $0.product == product ? newProduct: $0 }
        } else {
            cart.append(ProductOrder(product: product, quantity: 1))
        }
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        cart = cart.filter{$0.product != product}
        total -= product.price
    }
}
