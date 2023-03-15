import XCTest
@testable import SpmTester

struct TestOBJ: Codable {
    let origin: String
    let url: String
}

let _APITests_AppId = "appef6720db-cdfb-475d-8f49-703782c2b766"

final class ApiTests: XCTestCase {
    
    let installRemote = InstallationRemote()
    
    func testApiHeader() throws {
        let header = APIManager.getAPIHeader()
        XCTAssertNotNil(header.value(for: kIAMInstallationBundleId))
    }
    
    
    func testDebounceRegister() async throws {
        
        struct DebounceResp: Codable {
            let uuid: String
        }
        
            
        APIManager.shared.requestJSON(EndpointPath.register.rawValue , type: DebounceResp.self, method: .post,
                                      parameters: ["appId": _APITests_AppId, "type": "user"]) {
            resp in
            
            print("Register user \(resp)")
        }
        
    }
    
    func testFetchAchievements() async throws {
        
        struct DebounceResp: Codable {
            let appId: String
            let id: String
            let targetValue: String
        }
        
        APIManager.shared.requestJSON(EndpointPath.achievements.rawValue + "/\(_APITests_AppId)" , type: [DebounceResp].self, method: .get) {
            resp in
            
            print("get \(resp)")
        }
        
    }
    
    
}
