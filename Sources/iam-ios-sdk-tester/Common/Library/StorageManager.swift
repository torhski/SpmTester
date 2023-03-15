import Foundation

class StorageManager {
    private func baseQuery(key: String? = nil, groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = false, returnData: Bool? = false) -> Dictionary<CFString, Any> {
            var keychainQuery: [CFString: Any] = [kSecClass : kSecClassGenericPassword]
            if (key != nil) {
                keychainQuery[kSecAttrAccount] = key
                
            }
            
            if (groupId != nil) {
                keychainQuery[kSecAttrAccessGroup] = groupId
            }
            
            if (accountName != nil) {
                keychainQuery[kSecAttrService] = accountName
            }
            
            if (synchronizable != nil) {
                keychainQuery[kSecAttrSynchronizable] = synchronizable
            }
            
            if (returnData != nil) {
                keychainQuery[kSecReturnData] = returnData
            }
            return keychainQuery
        }
        
        internal func containsKey(key: String, groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = nil) -> Bool {
            if read(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable).value != nil {
                return true
            } else {
                return false
            }
        }
        
        internal func readAll(groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = false) -> SecureStorageResponse {
            var keychainQuery = baseQuery(key: nil, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: true)
            
            keychainQuery[kSecMatchLimit] = kSecMatchLimitAll
            keychainQuery[kSecReturnAttributes] = true
            
            var ref: AnyObject?
            let status = SecItemCopyMatching(
                keychainQuery as CFDictionary,
                &ref
            )
            
            var results: [String: String] = [:]
            
            if (status == noErr) {
                (ref as! NSArray).forEach { item in
                    let key: String = (item as! NSDictionary)[kSecAttrAccount] as! String
                    let value: String = String(data: (item as! NSDictionary)[kSecValueData] as! Data, encoding: .utf8) ?? ""
                    results[key] = value
                }
            }
            
            return SecureStorageResponse(status: status, value: results)
        }
        
        internal func read(key: String, groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = false) -> SecureStorageResponse {
            let keychainQuery = baseQuery(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: true)
            
            var ref: AnyObject?
            let status = SecItemCopyMatching(
                keychainQuery as CFDictionary,
                &ref
            )
            
            var value: String? = nil
            
            if (status == noErr) {
                value = String(data: ref as! Data, encoding: .utf8)
            }
            return SecureStorageResponse(status: status, value: value)
        }
        
        // TODO not working
        internal func deleteAll(groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = false) -> OSStatus {
            let keychainQuery = baseQuery(key: nil, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: nil)
            return SecItemDelete(keychainQuery as CFDictionary)
        }
        
        internal func delete(key: String, groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = false) -> OSStatus {
            let keychainQuery = baseQuery(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: true)
            return SecItemDelete(keychainQuery as CFDictionary)
        }
        
        internal func write(key: String, value: String, groupId: String? = nil, accountName: String? = nil, synchronizable: Bool? = false, accessibility: String? = nil) -> OSStatus {
            var attrAccessible: CFString = kSecAttrAccessibleWhenUnlocked
            if (accessibility != nil) {
                switch accessibility {
                case "passcode":
                    attrAccessible = kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
                    break;
                case "unlocked":
                    attrAccessible = kSecAttrAccessibleWhenUnlocked
                    break
                case "unlocked_this_device":
                    attrAccessible = kSecAttrAccessibleWhenUnlockedThisDeviceOnly
                    break
                case "first_unlock":
                    attrAccessible = kSecAttrAccessibleAfterFirstUnlock
                    break
                case "first_unlock_this_device":
                    attrAccessible = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
                    break
                default:
                    attrAccessible = kSecAttrAccessibleWhenUnlocked
                }
            }
            
            let keyExists = containsKey(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable)
            var keychainQuery = baseQuery(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: nil)
            if (keyExists) {
                let update: [CFString: Any?] = [
                    kSecValueData: value.data(using: String.Encoding.utf8),
                    kSecAttrAccessible: attrAccessible,
                    kSecAttrSynchronizable: synchronizable
                ]
                
                return SecItemUpdate(keychainQuery as CFDictionary, update as CFDictionary)
            } else {
                keychainQuery[kSecValueData] = value.data(using: String.Encoding.utf8)
                keychainQuery[kSecAttrAccessible] = attrAccessible
                return SecItemAdd(keychainQuery as CFDictionary, nil)
            }
        }
        
        struct SecureStorageResponse {
            var status: OSStatus?
            var value: Any?
        }
}