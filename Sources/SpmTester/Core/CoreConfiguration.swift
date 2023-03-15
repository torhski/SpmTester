
import Foundation

public struct CoreConfiguration {
   
    public var appId: String
    public var apiKey: String   // @token
    public var token: String
    public var refreshToken: String
    
    public init(_ appId: String, _ apiKey: String, _ token: String, _ refreshToken: String) {
        self.appId = appId
        self.apiKey = apiKey
        self.token = token
        self.refreshToken = refreshToken
    }
    
}
