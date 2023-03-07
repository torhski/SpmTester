
import XCTest
@testable import SpmTester


let key = "TestKey"
let groupId = "TestAppId"

final class StorageTests: XCTestCase {
    
    let storage = InstallationStore()
    
    func testExample() throws {
        storage.delete(key: key)
//        storage.deleteAll(groupId: groupId)
     
        print("after deleteAll \(storage.read(key: key).value)")
        XCTAssertNil(storage.read(key: key).value)
        
        let value = "TestValue"
        storage.write(key: key, value: value)
        
        XCTAssertEqual(String(describing: storage.read(key: key).value ?? ""), value)
    }
    
    func testDeleteAll() throws {
        // TODO
    }
}
