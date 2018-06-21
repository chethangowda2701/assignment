//
//  ProductViewModel.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import Foundation
import UIKit

class ProductViewModel {
    
    let product: Product!
    
    var name: String? {
        return product.name
    }
    
    var description: String? {
        return product.description
    }
  
    var license: String? {
        return product.license?.name
    }
    
    var createdAt: String? {
        return product.createdAt
    }
    
 
    
    init(product: Product) {
        self.product = product
    }
}
