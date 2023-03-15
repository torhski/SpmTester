import Foundation

class AchievementViewModel: ObservableObject {
    @Published private(set) var achievements: [AchievementModel] = []
    
    var appId = Core.appId()
    
    func load() {
        if self.appId == nil {
            return
        }
        
        
        APIManager.shared.requestJSON(EndpointPath.achievements.rawValue + "/\(self.appId!)", type: [AchievementsResponse].self, method: .get) {
            (response) in
            print("load \(response)")
            if response != nil {
                self.achievements = response!.map { AchievementModel(self.appId!, actionId: $0.id, targetValue: $0.targetValue) }
            } else {
                self.achievements = []
            }
        
        }
        
    }
    
}