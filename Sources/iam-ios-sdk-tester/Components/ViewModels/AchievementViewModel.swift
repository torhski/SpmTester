import Foundation

class AchievementViewModel: ObservableObject {
    @Published private(set) var achievements: [AchievementModel] = []
    
    var appId = Core.appId()
    
    func load() -> Void {
        if self.appId.isEmpty {
            return
        } else {
        
            APIManager.shared.requestJSON(EndpointPath.achievements.rawValue + "/\(self.appId)", type: [AchievementsResponse].self, method: .get) {
                (response) in
                
                if response != nil {
                    self.achievements = response!.map { AchievementModel(self.appId, actionId: $0.id, targetValue: $0.targetValue) }
                } else {
                    self.achievements = []
                }
            }
        }
    }
}
