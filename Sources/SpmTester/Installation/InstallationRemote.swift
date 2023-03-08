import Foundation
import Alamofire

let kIAMInstallationBundleId = "X-Ios-Bundle-Identifier"
let kIAMPublisherAppId = "X-Iam-App-Id"
let kIAMPublisherApiKey = "X-Iam-Api-Key"

class InstallationRemote {
    
    
    func createRequest(_ appId: String, auid: String? = nil, idProvider: String? = nil) async throws -> String {
        
        let resp = try await APIManager.shared.requestJSON(.Register, type: AuidRegisterResponse.self, method: .post, parameters: [
            "appId": appId
        ])
        return String(describing: resp.result)
    }
    
    func connectHub(_ appId: String, _auid: String, account: String) async {
        
    }
    
    func disconnectHub(_ appId: String, _auid: String, account: String) async {
        
    }
}
