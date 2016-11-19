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
    static let port: UInt16 = 8181
    
    static var baseURL: String {
        return "http://\(ip)"
    }
}
