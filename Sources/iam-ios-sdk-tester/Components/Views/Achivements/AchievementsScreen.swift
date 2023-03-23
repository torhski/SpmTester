
import SwiftUI

struct AchievementsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public init() {}
    
    public var body: some View {
        VStack {
            AchievementContent()
        }.navigationBarHidden(true)
            .padding(.top, 8)
            .background(Color.white)
            .foregroundColor(Color.black)
            
        #if os(iOS)
            .navigationBarBackButtonHidden(true)
        #else
            .navigationBarBackButtonHidden(false)
        #endif
        
        #if os(iOS)
            .navigationBarItems(leading: Button(action: {
                print("click drawer")
            }, label: {
                Text("Drawer")
            }), trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Close")
            }))
        #endif
    }
}

struct AchievementsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsScreen()
    }
}
