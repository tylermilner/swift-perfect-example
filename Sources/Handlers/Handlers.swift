//
//  Handlers.swift
//  PerfectTemplate
//
//  Created by Tyler Milner on 11/18/16.
//
//

import PerfectHTTP

class Handlers {
    
    // MARK: - Constants
    
    private static let defaultName = "World"
    
    // MARK: - Public
    
    /// Navigate to http://localhost:8181/ to see the default "Hello, World" message
    static func handleGetRoot(for request: HTTPRequest, response: HTTPResponse) {
        let defaultMessage = message(for: defaultName)
        
        response.setHeader(.contentType, value: "text/html")
        response.appendBody(string: "<html><title>\(defaultMessage)</title><body>\(defaultMessage)</body></html>")
        response.completed()
    }
    
    /// Navigate to http://localhost:8181/hello-world?name=Tyler to see a custom message returned as JSON
    static func handleGetHello(for request: HTTPRequest, response: HTTPResponse) {
        // Set headers
        response.setHeader(.contentType, value: "application/json")
        
        // Set JSON response
        // TODO: Could show example of error handling for when a name is not provided
        let name = request.param(name: "name")
        let messageResult = message(for: name)
        
        let jsonResult: [String: Any] = ["message": messageResult]
        
        do {
            try response.setBody(json: jsonResult)
        } catch let error {
            print("Error setting response body: \(error)")
            // TODO: Set response error (5xx)
        }
        response.completed()
    }
    
    // MARK: - Private
    
    private static func message(for name: String?) -> String {
        return "Hello, \(name ?? defaultName)!"
    }
}
