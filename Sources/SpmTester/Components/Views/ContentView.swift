
import SwiftUI

struct ContentView: View {
    
    var pageType: PageType
    
    public var body: some View {
        
        if pageType == .achievements {
            AchievementContent(appId: "test")
        } else if pageType == .ranking {
            RankingContent()
        } else if pageType == .setting {
            SettingContent()
        } else {
            ActivityContent()
        }
    }
}
