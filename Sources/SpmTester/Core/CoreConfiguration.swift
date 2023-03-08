
import Foundation

public enum Platform {  // TODO example
    case ANDROID, IOS, FLUTTER, WEB
}

public struct CoreConfiguration {
   
    public var appId: String
    public var apiKey: String   // @token
    public var token: String
    public var refreshToken: String
    public var platform: Platform
    
    public init(_ appId: String, _ apiKey: String, _ token: String, _ refreshToken: String, _ platform: Platform) {
        self.appId = appId
        self.apiKey = apiKey
        self.token = token
        self.refreshToken = refreshToken
        self.platform = platform
    }
    
}
