
import SwiftUI

public struct AchievementContent: View {
    @ObservedObject var viewModel = AchievementViewModel()
    var appId: String
    
    public var body: some View {
        Text("Achievements View")
        
        List(viewModel.achievements, id: \.self) {
            achievement in
            HStack {
                Text(achievement.actionId) 
                Text(achievement.targetValue)
            }
        }.onAppear {
            self.viewModel.load(appId)
        }
    }
}


struct AchievementContent_Previews: PreviewProvider {
    static var previews: some View {
        AchievementContent(appId: "testAppId")
    }
}
