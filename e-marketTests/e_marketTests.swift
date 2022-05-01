//
//  e_marketTests.swift
//  e-marketTests
//
//  Created by Kyawt May Hlaing on 26/04/2022.
//

import XCTest
@testable import e_market

class e_marketTests: XCTestCase {
    
    private var cart: CartController!
    
    override func setUp() {
        cart = CartController()
    }
    
    func testAddProductCountToCartCalculatingTotalPrice() {
        cart.addToCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        cart.addToCart(product: Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"))
        XCTAssertEqual(cart.total, 125)
    }
    
    func testDecreaseProductCountFromCartCalculatingTotalPrice() {
        cart.addToCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        cart.addToCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        cart.addToCart(product: Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"))
        cart.decreaseProductCount(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        XCTAssertEqual(cart.total, 125)
    }
    
    func testRemoveProductFromCart() {
        cart.addToCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        cart.addToCart(product: Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"))
        cart.addToCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        cart.removeFromCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        XCTAssertEqual(cart.total, 75)
    }
    
    func testClearCart() {
        cart.addToCart(product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"))
        cart.addToCart(product: Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"))
        XCTAssertEqual(cart.total, 0)
    }
    
}
