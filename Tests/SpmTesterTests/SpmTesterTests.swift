import XCTest
@testable import SpmTester

final class SpmTesterTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        print("test start")
        XCTAssertEqual(SpmTester().text, "Hello, World!")
        XCTAssertEqual(SpmTester().log(), "Hello, World!")
        print("test done")
    }
    
    func testCustomClassExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        print("test custom class start")
        
        print(Delegator().log())
    }
}
