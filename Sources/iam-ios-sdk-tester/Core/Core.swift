
import Foundation

public class Core {
    
    static private var _config: CoreConfiguration?
    static private var _installation = Installation()
    
    
    static public func initialize(_ config: CoreConfiguration) {
        _config = config
        
        _installation.loadAuid(config.appId)
    }
    
    static public func appId() -> String {
        return String(describing: _config?.appId)
    }
    
    // @debug
    static public func log() {
        if _config == nil {
            return
        }
        
        print("\(_config!.appId), \(_config!.apiKey), \(_config!.token), \(_config!.refreshToken)")
    }
}
