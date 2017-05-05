# I. Summary
## 1. What is unit test?
- Unit tests are small pieces of code that test the behavior of other code
- Unit tess are greate way to write better code
- Help find bugs early
- Easy to maintain with modular code

## 2. Why Unit Testing?
- Verify your code does what you expect
- Make refactoring much less paintfull
- Forces you to write smaller, more concise methods.

## 3. Is not Unit Test?
- It talks to the database
- It communicates across the network
- It touches the file system
- It can’t run at same time as any of your other unit tests
- You have to do special things to your environment (such as edit config file)

## 4. A Good Unit Test
- Able to be fully automated
- Tests a single logical  concept in the system
- Consistently returns the same result (no random numbers, save those for integration tests)
- Is maintainable and order-independent
- Is independent
- Runs fast
- Is Readable
- Is Trustworthy

# II- Unit test for iOS project

## 1. Add Test Target

In Xcode 8 : goto edit menu -> add target -> find "iOS Unit Tesing bundle" -> select it.

## 2. Writing Test Classes and Methods

### a. Creating a Test Class

In Xcode 8: see bottom left button (+) -> choose File -> Choose "Unit test Case Class". Remember that choose correct test target will add this file to.

# Test Class Structure
```
import XCTest
@testable import DhtUnitTest

class DhtUnitTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
}
```
### Notes 
From Apple: https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/04-writing_tests.html

Notice that the implementation contains methods for instance setup and teardown with a basic implementation; these methods are not required. If all of the test methods in a class require the same code, you can customize setUp and tearDown to include it. The code you add runs before and after each test method runs. You can optionally add customized methods for class setup (+ (void)setUp) and teardown (+ (void)tearDown) as well, which run before and after all of the test methods in the class.

### b. Writing Test Methods
-  A test method is an instance method of a test class that begins with the prefix test.
- Takes no parameters
- Returns void,
Example: func testIBOutlet(){}

### c. Writing Tests of Asynchronous Operations
-  XCTest has been enhanced in Xcode 6 to include the ability to serialize asynchronous execution in the test method, by waiting for the completion of an asynchronous callback or timeout.

```
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

```
