//
//  DhtUnitTestTests.swift
//  DhtUnitTestTests
//
//  Created by Nguyen Van Dung on 5/5/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import XCTest
@testable import DhtUnitTest

class DhtUnitTestTests: XCTestCase {
    var sessionTest: URLSession!

    override func setUp() {
        super.setUp()
        sessionTest = URLSession(configuration: URLSessionConfiguration.default)

    }
    
    override func tearDown() {
        sessionTest = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testAsynchronous() {
        // given
        guard let url = URL(string: "") else {
            return
        }
        // 1
        let promise = expectation(description: "Status code: 200")

        // when
        let dataTask = sessionTest.dataTask(with: url) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
}
