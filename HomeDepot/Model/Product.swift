//
//  Product.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import Foundation

struct Product {
    let name: String?
    let description: String?
    let createdAt: String?
    let license: License?
    
    init(json:JSONDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.createdAt = json["created_at"] as? String
        self.license = License(json: json["license"] as? JSONDictionary)
    }
    
    static func toArray(_ products: [JSONDictionary]?) -> [Product] {
        return products?.compactMap { Product(json: $0) } ?? []
    }
}

struct License {
    let key: String?
    let name: String?
    
    init?(json: JSONDictionary?) {
        guard let json = json else { return nil }
        self.key = json["key"] as? String
        self.name = json["name"] as? String
    }
}


