
import Foundation

public class Delegator {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func log() -> String {
        return text
    }
}
