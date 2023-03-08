import Foundation
import Alamofire

let ENDPOINT = ""
let kIAMInstallationBundleId = "X-Ios-Bundle-Identifier"
let kIAMPublisherAppId = "X-Iam-App-Id"
let kIAMPublisherApiKey = "X-Iam-Api-Key"

class InstallationRemote {
    
    
    func createRequest(_ appId: String, auid: String? = nil, idProvider: String? = nil) {
    
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
    
    
}

class APIManager: NSObject {
    internal static func getAPIHeader() -> HTTPHeaders {
        var header = HTTPHeaders()
        header.add(name: kIAMInstallationBundleId, value: String(describing: Bundle.main.bundleIdentifier))
        
        
        
        
        return header
    }
}
