import XCTest
@testable import iam_ios_sdk_tester

struct TestArgs: Codable {
    let username: String
    let password: String
}


struct TestOBJ: Codable {
    let origin: String
    let url: String
    let method: String
}

let _APITests_AppId = "appef6720db-cdfb-475d-8f49-703782c2b766"

final class ApiTests: XCTestCase {
    
    let installRemote = InstallationRemote()
    
    func testApiHeader() throws {
        let header = APIManager.getAPIHeader()
        XCTAssertNotNil(header.value(for: kIAMInstallationBundleId))
    }
    
    
    func testDebounceRegister() async throws {
        
        struct DebounceRegisterResp: Codable {
            let uuid: String
            let appId: String
        }
        
        APIManager.shared.requestJSON(EndpointPath.register.rawValue , type: DebounceRegisterResp.self, method: .post,
                                      parameters: ["type":"app", "publisherWallet": "0x1111"]) {
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
    
    func testAsync() async throws {
//        try await APIManager.shared.test(TestOBJ.self)
    }
    
    
}
