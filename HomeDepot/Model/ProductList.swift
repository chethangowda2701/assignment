//
//  ProductList.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import Foundation

struct ProductList {
    
    var products = [Product]()
    
    init(json: [JSONDictionary]) {
//        self.totalProducts = json["totalProducts"] as? Int
//        self.pageNumber = json["pageNumber"] as? Int
//        self.pageSize = json["pageSize"] as? Int
//        self.statusCode = json["statusCode"] as? Int
        self.products = Product.toArray(json)
    }
}
