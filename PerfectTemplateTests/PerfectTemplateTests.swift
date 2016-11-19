//
//  PerfectTemplateTests.swift
//  PerfectTemplateTests
//
//  Created by Tyler Milner on 11/3/16.
//
//

import XCTest

class PerfectTemplateTests: XCTestCase {
    
    private let baseURL = API.baseURL
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let asyncExpectation = expectation(description: "GET '/'")
        
        let task = URLSession.shared.dataTask(with: baseURL, completionHandler: { (data, response, error) in
            asyncExpectation.fulfill()
            
            guard let data = data else {
                XCTFail("No data: \(error)")
                return
            }
            
            guard let message = String(data: data, encoding: .utf8) else {
                XCTFail("Not a string")
                return
            }
            
            XCTAssertTrue(message.contains("Hello, World!"))
        }).resume()
    }
}
