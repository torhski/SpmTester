import Foundation
import Alamofire

let ENDPOINT = "https://iam.debounce.network"

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
    
//
//    func test<T: Decodable>(_ type: T.Type) async throws -> T {
//        return try await session.request("https://httpbin.org/get",
//                                         method: .get,
//
//                                                 encoding: URLEncoding.default)
//                .serializingDecodable()
//                .value
//    }
    
    func requestJSON<T: Decodable>(_ path: String,
                                     type: T.Type,
                                     method: HTTPMethod,
                                     parameters: Parameters? = nil,
                                     completionHandler: @escaping (T) -> Void) {
        
        session.request(ENDPOINT + path,
                   method: method,
                   parameters: parameters,
                   encoding: URLEncoding.default).responseDecodable(of: type) { response in
            
            completionHandler(response.value!)
        }
    }
    
}
