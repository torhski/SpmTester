
import Foundation

public class Core {
    
    static private var _config: CoreConfiguration?
    private var _storage = InstallationStore()
    
    
    static public func initialize(_ config: CoreConfiguration) {
        _config = config
    }
    
    static public func appId() -> String? {
        return _config?.appId
    }
    
    // @debug
    static public func log() {
        if _config == nil {
            return
        }
        
        print("\(_config!.appId), \(_config!.apiKey), \(_config!.token), \(_config!.refreshToken), \(_config!.platform)")
    }
}
