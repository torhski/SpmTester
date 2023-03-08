
import Foundation

var kIAMAuidPrefix = "KEY_IAM_Auid_"

public class Installation {
    
    var auid: String?
    private var _store = InstallationStore()
    
    func loadAuid(_ appId: String, auid: String? = nil, idProvider: String? = nil) async throws {
    
        if auid != nil {
            return
        }
        
        if let cached = _store.read(key: self._auidKey(appId)).value {
            self.auid = String(describing: cached)
        }
        
        if self.auid == nil {
            try await self._generateAuid(appId)
        }
    }
    
    func refreshAuid(_ appId: String) async throws {
        
        self.auid = nil
        _store.delete(key: self._auidKey(appId))
        
        try await self.loadAuid(appId)
    }
    
    private func _generateAuid(_ appId: String) async throws {
        
        do {
            self.auid = try await InstallationRemote().createRequest(appId, auid: self.auid)
        } catch {
            debugPrint("_generateAuid error")
        }
        
    }
    
    private func _auidKey(_ appId: String) -> String {
        return kIAMAuidPrefix + appId
    }
}
