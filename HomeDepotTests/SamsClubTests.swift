//
//  SamsClubTests.swift
//  SamsClubTests
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import XCTest
@testable import SamsClub

class SamsClubTests: XCTestCase {
    
    private var jsonString: String {
        return """
        {
        "products": [{
        "productId": "218ca04a-0a9f-42b3-9fa5-1ca592fc7d29",
        "productName": "LG 32\" Class 720P LED HDTV - 32LF500B",
        "shortDescription": "shortDescription",
        "longDescription": "long Description",
        "price": "$217.88",
        "productImage": "/images/image5.jpeg",
        "reviewRating": 4.8125,
        "reviewCount": 16,
        "inStock": true
        }, {
        "productId": "23f7ff8e-5fa9-47ab-aa8d-41882aa43ccf",
        "productName": "Sherwood 70-Watt A/V Receiver with HDMI Switching",
        "longDescription": "long Description",
        "price": "$149.86",
        "productImage": "/images/image8.jpeg",
        "reviewRating": 5,
        "reviewCount": 1,
        "inStock": true
        }, {
        "productId": "240b3848-c12b-4b0d-b5b9-1b42b85d09cc",
        "productName": "Logitech Harmony 650 Remote",
        "shortDescription": "short Description",
        "longDescription": "long Description",
        "price": "$59.99",
        "productImage": "/images/image1.jpeg",
        "reviewRating": 3.3333,
        "reviewCount": 9,
        "inStock": true
        }, {
        "productId": "25375f53-2c23-4726-8a8b-b0aa10851b67",
        "productName": "Google Chromecast Streaming Media Player with $10 Google Play Credit",
        "shortDescription": "short Description",
        "longDescription": "long Description",
        "price": "$34.86",
        "productImage": "/images/image9.jpeg",
        "reviewRating": 0,
        "reviewCount": 0,
        "inStock": true
        }, {
        "productId": "254294a0-8b62-4f59-8dd9-e0451bebd9d1",
        "productName": "TCL 40\" Class 1080p LED HDTV - 40FD2700",
        "shortDescription": "short Description",
        "longDescription": "long Description",
        "price": "$288.00",
        "productImage": "/images/image3.jpeg",
        "reviewRating": 0,
        "reviewCount": 0,
        "inStock": true
        }],
        "totalProducts": 224,
        "pageNumber": 1,
        "pageSize": 30,
        "statusCode": 200
        }
        """
    }
    
    func testViewModelData() {
       /* guard let json = self.jsonString.data(using: .utf8), let deserialized = try? JSONSerialization.jsonObject(with: json, options: []) as? JSONDictionary else { return }
        let viewModel = ProductListViewModel()
        viewModel.productList = ProductList(json: deserialized!)
        
        XCTAssert(!viewModel.products.isEmpty)
        XCTAssertEqual(viewModel.totalProductsCount, 224)
        XCTAssertEqual(viewModel.pageNumber, 1)
        XCTAssert(viewModel.products[0].inStock)
        XCTAssertEqual(viewModel.products[1].productName, "Sherwood 70-Watt A/V Receiver with HDMI Switching")
        XCTAssertEqual(viewModel.products[0].reviewCount, 16)
        XCTAssertEqual(viewModel.products[0].reviewRating, 4.8125) */
    }
}
