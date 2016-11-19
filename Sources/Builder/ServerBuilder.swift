//
//  ServerBuilder.swift
//  PerfectTemplate
//
//  Created by Tyler Milner on 11/18/16.
//
//

import PerfectHTTPServer

class ServerBuilder {
    
    // MARK: - Public
    
    static func createServer() -> HTTPServer {
        // Create HTTP server.
        let server = HTTPServer()
        
        // Create the JSON routes
        let jsonRoutes = RoutesBuilder.createJSONRoutes()
        
        // Add the routes to the server.
        server.addRoutes(jsonRoutes)
        
        // Set a listen port of 8181
        server.serverPort = API.port
        
        // Set a document root.
        // This is optional. If you do not want to serve static content then do not set this.
        // Setting the document root will automatically add a static file handler for the route /**
        server.documentRoot = "./webroot"
        
        // Gather command line options and further configure the server.
        // Run the server with --help to see the list of supported arguments.
        // Command line arguments will supplant any of the values set above.
        configureServer(server)
        
        return server
    }
}
