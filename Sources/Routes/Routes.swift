//
//  Routes.swift
//  PerfectTemplate
//
//  Created by Tyler Milner on 11/18/16.
//
//

import PerfectHTTP

class RoutesBuilder {
    
    // MARK: - Public
    
    static func createJSONRoutes() -> Routes {
        var routes = Routes()
        
        routes.add(method: .get, uri: API.Endpoint.root.rawValue, handler: Handlers.handleGetRoot)
        routes.add(method: .get, uri: API.Endpoint.hello.rawValue, handler: Handlers.handleGetHello)
        
        return routes
    }
}
