//
//  ProductListViewModel.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import Foundation

class ProductListViewModel {
    var products = [ProductViewModel]()
    var isFetchingMore = false
    
    var productList: ProductList {
        didSet {
            self.products.append(contentsOf: self.currentProducts)
        }
    }

    var currentProducts: [ProductViewModel] {
        return self.productList.products.compactMap(ProductViewModel.init)
    }
 
   /* var totalProductsCount: Int {
        return productList.totalProducts ?? 0
    } */
    
    var pageNumber = 0
    
    init(productList: ProductList) {
        self.productList = productList
    }
    
    init() {
        self.productList = ProductList(json: [[:]])
    }
}
