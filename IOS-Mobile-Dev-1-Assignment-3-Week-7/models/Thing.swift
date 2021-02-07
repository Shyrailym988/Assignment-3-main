//
//  Thing.swift
//  IOS-Mobile-Dev-1-Assignment-3-Week-7
//
//  Created by admin on 07.02.2021.
//

import Foundation

struct Thing {
    let name: String?
    let description: String?
    let price: Double?
    let imageName: String?
}

class CartSingltone {
    var cartThing = [Thing]()
    
    static var shared: CartSingltone = {
        let instance = CartSingltone()

        return instance
    }()
    
    private init(){}
    
    func addToCart(_ item: Thing) {
        self.cartThing.append(item)
    }
    
    func buyAllFromCart() {
        self.cartThing.removeAll()
    }
    
    func removeItem(_ index: Int) {
        self.cartThing.remove(at: index)
    }
}
