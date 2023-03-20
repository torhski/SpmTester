
import SwiftUI

public struct AchievementContent: View {
    @ObservedObject var viewModel = AchievementViewModel()
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    public var body: some View {
        Text("Achievements View")
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.achievements, id: \.self) { achievement in
                    HStack {
                        Text(achievement.actionId)
                        Text(achievement.targetValue)
                    }.cornerRadius(15)
                        .padding()
                }
            }
        }.onAppear {
            self.viewModel.load()
        }
    }
}


struct AchievementContent_Previews: PreviewProvider {
    static var previews: some View {
        AchievementContent()
    }
}
