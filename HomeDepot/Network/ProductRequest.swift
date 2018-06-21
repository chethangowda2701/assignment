//
//  ProductRequest.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import UIKit

struct ProductRequest: NetworkRequest {
    let pageNumber: Int
    let pageSize = 10
    let user: String
    
    var headers: [String : String] {
        return ["Content-Type" : "application/json"]
    }
    
    var urlString: String {
        return "/users/\(self.user)/repos"
    }
    
    var queryParams: [URLQueryItem] {
        return [URLQueryItem(name: "page", value: "\(self.pageNumber)"), URLQueryItem(name: "per_page", value: "\(self.pageSize)")]
    }
}
