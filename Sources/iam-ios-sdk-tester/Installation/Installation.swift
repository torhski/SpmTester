
import Foundation

var kIAMAuidPrefix = "KEY_IAM_Auid_"

public class Installation {
    
    var auid: String = ""
    private var _storage = StorageManager()
    
    func loadAuid(_ appId: String, auid: String? = nil, idProvider: String? = nil) {
    
        if auid != nil {
            return
        }
        
        if let cached = _storage.read(key: self._auidKey(appId)).value {
            self.auid = String(describing: cached)
        }
    
        if self.auid.isEmpty {
            self._generateAuid(appId)
        }
    }
    
    func refreshAuid(_ appId: String) {
        
        self.auid = ""
        _storage.delete(key: self._auidKey(appId))
        
        self.loadAuid(appId)
    }
    
    private func _generateAuid(_ appId: String) {
        
        do {
            InstallationRemote().createRequest(appId, auid: self.auid) {
                resp in
                
                self.auid = String(describing: resp?.uuid)
                self._storage.write(key: self._auidKey(appId), value: resp?.uuid ?? "")
            }
        } catch {
            debugPrint("_generateAuid error")
        }
        
    }
    
    private func _auidKey(_ appId: String) -> String {
        return kIAMAuidPrefix + appId
    }
}
