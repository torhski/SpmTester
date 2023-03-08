import SwiftUI

struct AchievementItem: View {
    
    var state: AchievementsState
    
    public init(_ state: AchievementsState) {
        self.state = state
    }
    
    public var body: some View {
        Text("Hello")
    }
}


struct AchievementItem_Previews: PreviewProvider {
    static var previews: some View {
        AchievementItem(.completed)
    }
}
