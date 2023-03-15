import Foundation
import Alamofire

let kIAMInstallationBundleId = "X-Ios-Bundle-Identifier"
let kIAMPublisherAppId = "X-Iam-App-Id"
let kIAMPublisherApiKey = "X-Iam-Api-Key"

class InstallationRemote {
    
    
    func createRequest(_ appId: String, auid: String? = nil, idProvider: String? = nil,
                       completeHandler: @escaping (AuidRegisterResponse) -> Void) {
        
        APIManager.shared.requestJSON(EndpointPath.register.rawValue, type: AuidRegisterResponse.self, method: .post, parameters: [
            "appId": appId, "type": "user"
        ], completionHandler: completeHandler)
    }
    
    func connectHub(_ appId: String, _auid: String, account: String) async {
        
    }
    
    func disconnectHub(_ appId: String, _auid: String, account: String) async {
        
    }
}
