
import SwiftUI

struct ContentView: View {
    
    var pageType: PageType
    
    public var body: some View {
        
        if pageType == PageType.ACHIEVMENTS {
            AchievementContent()
        } else if pageType == PageType.RANKING {
            RankingContent()
        } else if pageType == PageType.SETTING {
            SettingContent()
        } else {
            ActivityContent()
        }
    }
}
