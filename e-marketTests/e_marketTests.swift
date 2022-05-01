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
    var storeViewModel: StoreViewModel!
    var mockStoreService: MockStoreService!
    var productViewModel: ProductViewModel!
    var mockProductService: MockProductService!
    private var store1: Store = Store(name: "The Coffee Shop", openingTime: "15:01:01.772Z", closingTime: "19:45:51.365Z")
    private var product1: Product = Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg")
    private var product2: Product = Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg")
    
    override func setUp() {
        cart = CartController()
        mockStoreService = MockStoreService()
        mockProductService = MockProductService()
        storeViewModel = .init(storeService: mockStoreService)
        productViewModel = .init(productService: mockProductService)
    }
    
    func testStoreService() {
        self.storeViewModel.fetchStoreInformation()
        XCTAssertEqual(self.storeViewModel.storeInfo, store1)
    }

    func testProductService() {
        self.productViewModel.fetchProducts()
        XCTAssertEqual(self.productViewModel.products, [Product(name: "Hello", price: 0, imageUrl: "")])
    }
    
    func testAddProductCountToCartCalculatingTotalPrice() {
        cart.addToCart(product: product1)
        cart.addToCart(product: product1)
        XCTAssertEqual(cart.total, 100)
    }
    
    func testDecreaseProductCountFromCartCalculatingTotalPrice() {
        cart.addToCart(product: product1)
        cart.addToCart(product: product1)
        cart.addToCart(product: product2)
        cart.decreaseProductCount(product: product1)
        XCTAssertEqual(cart.total, 125)
    }
    
    func testRemoveProductFromCart() {
        cart.addToCart(product: product1)
        cart.addToCart(product: product1)
        cart.addToCart(product: product2)
        cart.removeFromCart(product: product1)
        XCTAssertEqual(cart.total, 75)
    }
    
    //    func testClearCart() {
    //        cart.addToCart(product: product1)
    //        cart.addToCart(product: product1)
    //        cart.clearCart()
    //        XCTAssertEqual(cart, [])
    //    }
    
}
