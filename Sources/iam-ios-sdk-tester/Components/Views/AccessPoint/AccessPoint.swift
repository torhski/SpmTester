import SwiftUI

// absolute position
// tl (default), tr, bl, br

class Navigation: ObservableObject {
    @Published var productFamilyIsActive : String? = nil // here
}

public struct AccessPoint: View {

    @EnvironmentObject var navigation : Navigation
    
    public init() {}
    
    public var body: some View {

        // TODO execute new window, route new page
        Text("AccessPoint")
        
    }
}

struct AccessPoint_Previews: PreviewProvider {
    static var previews: some View {
        AccessPoint()
    }
}
