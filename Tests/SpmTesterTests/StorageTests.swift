
import XCTest
@testable import SpmTester


let key = "TestKey"
let groupId = "TestAppId"
let testValue: String = "TestValue"
let testAppId = "appf86a2394-2474-48ef-ae5c-86f9a2dbcec0"

final class StorageTests: XCTestCase {
    
    let storage = InstallationStore()
    let installation = Installation()
    
    func testStorage() throws {
        storage.delete(key: key)
        XCTAssertNil(storage.read(key: key).value)

        
        storage.write(key: key, value: testValue)

        XCTAssertEqual(String(describing: storage.read(key: key).value ?? ""), testValue)
    }
    
    func testDeleteAll() throws {
        // TODO
        
//        print("deleteALl \(Bundle.main.bundleIdentifier)")
        
    }
    
    func testInstallationStoreLoad() async throws {
        
//        storage.write(key: kIAMAuidPrefix + testAppId, value: testValue)
        
        try await installation.loadAuid(testAppId)
    }
}
