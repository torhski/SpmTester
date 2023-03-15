import XCTest
@testable import SpmTester

let appId = "testAppId"
let token = "testToken"
let refreshToken = "testRefreshToken"
let apiKey = "testApikey"
let config = CoreConfiguration(appId, apiKey, token, refreshToken)

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
    
    
    func testCore() throws {
        Core.initialize(config)
        XCTAssertEqual(Core.appId(), appId)
    }
}
