//
//  NetworkRequest.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String: Any]

protocol NetworkRequest {
    var urlString: String { get }
    var headers: [String: String] { get }
    var queryParams: [URLQueryItem] { get }
}

extension NetworkRequest {
    var domain: String {
        return "https://api.github.com"
    }
    
    func make(success: @escaping ((_ json: [JSONDictionary]) -> ()), failure: @escaping (() -> ())) {
        
        guard let requestUrl = URL(string: "\(self.domain)\(self.urlString)") else { return }
        var urlComponents = URLComponents(url: requestUrl, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = self.queryParams
        var request = URLRequest(url: (urlComponents?.url)!)
        request.allHTTPHeaderFields = self.headers
        let task = URLSession.shared.dataTask(with: request) {
            (data, _, error) in
            guard error == nil, let usableData = data else {
                print(error.debugDescription)
                failure()
                return
            }
            guard let serialized = try? JSONSerialization.jsonObject(with: usableData, options: []) as? [JSONDictionary], let json = serialized, !json.isEmpty else {
                failure()
                return
            }
            success(json)
        }
        task.resume()
    }
    
    
    
}
