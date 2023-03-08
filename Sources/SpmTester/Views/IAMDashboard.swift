
import SwiftUI

public enum PageType {
    case feed, achievements, ranking, setting
}


public struct IAMDashboard: View {
    
    var pageType: PageType
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public init(_ pageType: PageType) {
        self.pageType = pageType
    }
    
    public var body: some View {
        VStack {
            ContentView(pageType: pageType)
        }
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

struct IAMDashboard_Previews: PreviewProvider {
    static var previews: some View {
        IAMDashboard(.ranking)
    }
}
