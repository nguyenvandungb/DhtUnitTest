<b>I. Summary </b>
<b>1. What is unit test?</b>
- Unit tests are small pieces of code that test the behavior of other code
- Unit tess are greate way to write better code
- Help find bugs early
- Easy to maintain with modular code

<b>2. Why Unit Testing?</b>
- Verify your code does what you expect
- Make refactoring much less paintfull
- Forces you to write smaller, more concise methods.

<b>3. Is not Unit Test?</b>
- It talks to the database
- It communicates across the network
- It touches the file system
- It can’t run at same time as any of your other unit tests
- You have to do special things to your environment (such as edit config file)

<b>4. A Good Unit Test</b>
- Able to be fully automated
- Tests a single logical  concept in the system
- Consistently returns the same result (no random numbers, save those for integration tests)
- Is maintainable and order-independent
- Is independent
- Runs fast
- Is Readable
- Is Trustworthy

<b>II- Unit test for iOS project</b>

<b>1. Add Test Target</b>

In Xcode 8 : goto edit menu -> add target -> find "iOS Unit Tesing bundle" -> select it.

<b>2. Writing Test Classes and Methods</b>

<b>a. Creating a Test Class</b>

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
