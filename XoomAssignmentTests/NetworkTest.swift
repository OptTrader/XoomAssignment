//
//  NetworkTest.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/30/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//
//  http://www.mokacoding.com/blog/testing-callbacks-in-swift-with-xctest/

import XCTest
@testable import XoomAssignment

class NetworkTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNetwork() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let symbol = Country.Canada.code
        let expect = expectation(description: "Xoom Api network call")
        
        NetworkManager.requestExchangeRate(symbol: symbol, onSuccess: { data in
            XCTAssertNotNil(data, "currency data should not be nil")
            XCTAssertEqual(data.currencySymbol, "CAD")
            expect.fulfill()
        }, onError: { error in
            XCTFail("waitForExpectationsWithTimeout error: \(error.localizedDescription)")
        })
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
