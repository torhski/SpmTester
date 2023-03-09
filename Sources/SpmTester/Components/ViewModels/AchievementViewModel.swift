import Foundation

class AchievementViewModel: ObservableObject {
    @Published private(set) var achievements: [AchievementModel] = []
    
    
    func load(_ appId: String) {
        
        //        APIManager.shared.responseJSON("\(EndpointPath.achievements.rawValue) + \(appId)", type: AchievementsResponse.self, method: .get) {
        //            (response) in
        //            print("load \(response)")
        //        }
        
        // dummny list
        
        achievements = [
            AchievementModel(appId, actionId: "action2621a3e4-360e-4b8e-acec-c86a663eb53e", targetValue: "100"),
            AchievementModel(appId, actionId: "action9ec8d978-498e-40e9-b8cd-1dc01fe0b66c", targetValue: "1000")
        ]
    }
    
    
    
}
