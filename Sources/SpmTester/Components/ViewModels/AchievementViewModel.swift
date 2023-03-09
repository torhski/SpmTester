import Foundation

class AchievementViewModel: ObservableObject {
    @Published private(set) var achievements: [AchievementModel] = []
    
    
    func load(_ appId: String) {
        
        APIManager.shared.requestJSON("\(EndpointPath.achievements.rawValue) + \(appId)", type: [AchievementsResponse].self, method: .get) {
            (response) in
            print("load \(response)")
            self.achievements = response.map { AchievementModel(appId, actionId: $0.actionId, targetValue: $0.targetValue) }
        
        }
        
    }
    
}
