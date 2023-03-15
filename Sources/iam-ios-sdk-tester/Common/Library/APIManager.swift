import Foundation
import Alamofire

let ENDPOINT = "https://92hxval5kb.execute-api.us-east-1.amazonaws.com/Prod/"

class APIManager {
    internal static func getAPIHeader() -> HTTPHeaders {
        var header = HTTPHeaders()
        header.add(name: kIAMInstallationBundleId, value: String(describing: Bundle.main.bundleIdentifier ?? ""))
        
        return header
    }
    
    static let shared = APIManager()
    
    private init() { }
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return Session(configuration: configuration)
    }()
    
    func requestJSON<T: Decodable>(_ path: String,
                                   type: T.Type,
                                   method: HTTPMethod,
                                   parameters: Parameters? = nil,
                                   completionHandler: @escaping (T?) -> Void) {
        
        session.request(ENDPOINT + path,
                        method: method,
                        parameters: parameters,
                        encoding: JSONEncoding.default,
                        headers: ["Content-Type": "application/json"])
        .validate(statusCode: 200..<300)
        .responseDecodable(of: type) { response in
            completionHandler(response.value)
        }
    }
}
