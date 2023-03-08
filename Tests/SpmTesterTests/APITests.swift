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
}
