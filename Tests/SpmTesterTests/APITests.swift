import XCTest
@testable import SpmTester

struct TestOBJ: Codable {
    let origin: String
    let url: String
}

let _APITests_AppId = "appe29e059f-731e-4718-ab77-a8e038b8358b"

final class ApiTests: XCTestCase {
    
    let installRemote = InstallationRemote()
    
    func testApiHeader() throws {
        let header = APIManager.getAPIHeader()
        XCTAssertNotNil(header.value(for: kIAMInstallationBundleId))
    }
    
    
    func testDebounceRegister() throws {
        
        struct DebounceResp: Codable {
            let reason: String
            let result: String
        }
        
            
        APIManager.shared.requestJSON(EndpointPath.register.rawValue , type: DebounceResp.self, method: .post,
                                                           parameters: ["appId": _APITests_AppId]) {
            resp in
            
            print("Register user \(resp)")
        }
    }
    
    func testFetchAchievements() async throws {
        
        struct DebounceResp: Codable {
            let actionId: String
            let createdAt: String
            let targetValue: String
        }
        
        APIManager.shared.requestJSON(EndpointPath.achievements.rawValue + "/\(_APITests_AppId)" , type: DebounceResp.self, method: .get) {
            resp in
            
            print("get \(resp)")
        }
        
//        let resp1 = try await APIManager.shared.test(TestOBJ.self)
//        print("testTests resp \(resp1)")
        
    }
}
