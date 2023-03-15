
import Foundation

var kIAMAuidPrefix = "KEY_IAM_Auid_"

public class Installation {
    
    var auid: String?
    private var _store = InstallationStore()
    
    func loadAuid(_ appId: String, auid: String? = nil, idProvider: String? = nil) {
    
        if auid != nil {
            return
        }
        
        if let cached = _store.read(key: self._auidKey(appId)).value {
            self.auid = String(describing: cached)
        }
        
        print("cached from local \(self.auid)")
        
        if self.auid == nil {
            self._generateAuid(appId)
        }
    }
    
    func refreshAuid(_ appId: String) {
        
        self.auid = nil
        _store.delete(key: self._auidKey(appId))
        
        self.loadAuid(appId)
    }
    
    private func _generateAuid(_ appId: String) {
        
        do {
            InstallationRemote().createRequest(appId, auid: self.auid) {
                resp in
                print("_generateAuid \(resp)")
                self.auid = resp?.uuid
            }
        } catch {
            debugPrint("_generateAuid error")
        }
        
    }
    
    private func _auidKey(_ appId: String) -> String {
        return kIAMAuidPrefix + appId
    }
}
