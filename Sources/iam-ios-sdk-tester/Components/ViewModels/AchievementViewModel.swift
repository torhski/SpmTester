import Foundation

class AchievementViewModel: ObservableObject {
    @Published private(set) var achievements: [AchievementModel] = []
    
    var appId = Core.appId()
    
    func load() -> Void {
        
        if true {
            achievements = [
            
                AchievementModel("", player: "", actionId: "", targetValue: "10"),
                AchievementModel("", player: "", actionId: "", targetValue: "130"),
                AchievementModel("", player: "", actionId: "", targetValue: "20"),
                AchievementModel("", player: "", actionId: "", targetValue: "410"),
                AchievementModel("", player: "", actionId: "", targetValue: "120"),
                AchievementModel("", player: "", actionId: "", targetValue: "220"),
                AchievementModel("", player: "", actionId: "", targetValue: "320"),
                AchievementModel("", player: "", actionId: "", targetValue: "210"),
                AchievementModel("", player: "", actionId: "", targetValue: "200"),
                
            ]
            return
        }
        
        
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
