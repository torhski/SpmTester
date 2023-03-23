
import SwiftUI

public struct AchievementContent: View {
    @ObservedObject var viewModel = AchievementViewModel()
  
    
    public var body: some View {
        Text("Achievements View")
    }
}


struct AchievementContent_Previews: PreviewProvider {
    static var previews: some View {
        AchievementContent()
    }
}
