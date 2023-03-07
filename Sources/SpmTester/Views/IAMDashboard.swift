
import SwiftUI

public enum PageType {
    case ACTIVITY, ACHIEVMENTS, RANKING, SETTING
}

public struct IAMDashboard: View {
    
    var pageType: PageType
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    public var body: some View {
        VStack {
            ContentView(pageType: pageType)
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                print("click drawer")
            }, label: {
                Text("Drawer")
            }), trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Close")
            }))
    }
}

struct IAMDashboard_Previews: PreviewProvider {
    static var previews: some View {
        IAMDashboard(pageType: PageType.RANKING)
    }
}
