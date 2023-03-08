import Foundation
import Alamofire

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
    
    func requestJSON<T: Decodable>(_ url: String,
                                   type: T.Type,
                                   method: HTTPMethod,
                                   parameters: Parameters? = nil) async throws -> T {
        
        return try await session.request(url,
                                         method: method,
                                         parameters: parameters,
                                         encoding: URLEncoding.default)
        .serializingDecodable()
        .value
    }
}
