import Foundation
import Alamofire

let ENDPOINT = ""
let kIAMInstallationBundleId = "X-Ios-Bundle-Identifier"
let kIAMPublisherAppId = "X-Iam-App-Id"
let kIAMPublisherApiKey = "X-Iam-Api-Key"

class InstallationRemote {
    
    
    func createRequest(_ appId: String, auid: String? = nil, idProvider: String? = nil) {
        print("createRequest")
        
        

        
        AF.request("https://httpbin.org/get").responseJSON {
            response in
            print("request: \(String(describing: response.request))")
            
            print("response: \(String(describing: response.response))")
            
            print("result: \(String(describing: response.result))")
        }
    }
    
    
}
