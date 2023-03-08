import XCTest
@testable import SpmTester

struct TestOBJ: Codable {
    let origin: String
    let url: String
}

final class ApiTests: XCTestCase {
    
    let installRemote = InstallationRemote()
    
    func testApiHeader() throws {
        let header = APIManager.getAPIHeader()
        XCTAssertNotNil(header.value(for: kIAMInstallationBundleId))
    }
    
    func testApiExample() async throws {
        let endpoint = "https://httpbin.org/get"
        let resp = try await APIManager.shared.requestJSON(endpoint, type: TestOBJ.self, method: .get)
        XCTAssertEqual(resp.url, endpoint)
    }
    
    
    func testDebounceRegister() async throws {
        
        struct DebounceResp: Codable {
            let reason: String
            let result: String
        }
        
        let resp = try await APIManager.shared.requestJSON(.Register, type: DebounceResp.self, method: .post,
                                                           parameters: ["appId": "appf86a2394-2474-48ef-ae5c-86f9a2dbcec0"])
        
        print("Register user \(resp)")
    }
}
