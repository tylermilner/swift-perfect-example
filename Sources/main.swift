//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let defaultName = "World"

func message(for name: String?) -> String {
    return "Hello, \(name ?? defaultName)!"
}

// Create HTTP server.
let server = HTTPServer()

// Register your own routes and handlers
var routes = Routes()

/// Navigate to http://localhost:8181/ to see the default Hello, World message
routes.add(method: .get, uri: "/", handler: {
    request, response in
    // NOTE: Comment out the above line and uncomment the below two is also valid. Most of the time, the above line is written on the same line as the opening curly brace.
//    let request = $0
//    let response = $1
    
    let defaultMessage = message(for: defaultName)
    
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>\(defaultMessage)</title><body>\(defaultMessage)</body></html>")
    response.completed()
	}
)

/// Navigate to http://localhost:8181/hello-world?name=Tyler to see a custom message returned as JSON
routes.add(method: .get, uri: "/hello-world") { (request, response) in
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
        // TODO: Set response error
    }
    response.completed()
}

// Add the routes to the server.
server.addRoutes(routes)

// Set a listen port of 8181
server.serverPort = 8181

// Set a document root.
// This is optional. If you do not want to serve static content then do not set this.
// Setting the document root will automatically add a static file handler for the route /**
server.documentRoot = "./webroot"

// Gather command line options and further configure the server.
// Run the server with --help to see the list of supported arguments.
// Command line arguments will supplant any of the values set above.
configureServer(server)

do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
