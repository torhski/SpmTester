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
    
    // debug
    var actionId: String
    var targetValue: String
    var image: String
    
    public init(_ identifier: String,
                player: String = "",
                actionId: String = "",
                targetValue: String = ""
    ) {
        self.identifier = identifier
        self.player = player
        self.actionId = actionId
        self.targetValue = targetValue
        self.image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB2ysrPvhIBLoo22vh1IW1cPRT4YEaSA52Rg"
    }
    
    
}
