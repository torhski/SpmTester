import Foundation

class AchievementModel: NSObject {
    
    var identifier: String  // appId
    var player: String // auid @option
    var percentComplete: Double {
        get {
            return self.percentComplete
        }
        set(value) {
            self.percentComplete = value
        }
    }
    var isCompleted: Bool {
        get {
            return percentComplete >= 100.0
        }
        set(value) {
            self.isCompleted = value
        }
    }
    var lastReportedDate: Date {
        get {
            return self.lastReportedDate
        }
        set(value) {
            self.lastReportedDate = value
        }
    }
    
    
    public init(_ identifier: String, player: String = "") {
        self.identifier = identifier
        self.player = player
    }
    
    
}
