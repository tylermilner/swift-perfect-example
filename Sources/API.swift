//
//  API.swift
//  PerfectTemplate
//
//  Created by Tyler Milner on 11/3/16.
//
//

import Foundation

struct API {
    enum Endpoint: String {
        case root = "/"
        case hello = "/hello"
    }
    
    static let hostname = "localhost"
    static let ip = "0.0.0.0"
    static let port = 8181
    
    static var baseURL: URL {
        guard let url = URL(string: "http://\(ip)") else { fatalError("Unable to generate base URL") }
        return url
    }
}
