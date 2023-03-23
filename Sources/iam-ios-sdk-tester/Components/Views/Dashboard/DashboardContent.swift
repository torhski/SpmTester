
import SwiftUI
import SDWebImageSwiftUI

struct DashboardContent: View {
    
    @ObservedObject var viewModel = AchievementViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public var body: some View {
        
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                HStack(alignment: .bottom) {
                    Spacer()
                    Image(systemName: "xmark").onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                }.padding(.bottom, 24)
                    .frame(minWidth: 0, maxWidth: .infinity)
            
                Text("Activity").padding(.bottom, 16)
            
                
                
            }.padding(.horizontal, 16)
                .frame(minWidth: 0, maxWidth: .infinity)
                
            
            _activity
        }
    }
    
    var _activity: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("0").padding(.bottom, 8)
                    Text("Act 1")
                }.padding(.trailing, 16)
                
                VStack(alignment: .leading) {
                    Text("10").padding(.bottom, 8)
                    Text("Act 2")
                }.padding(.trailing, 16)
                
                VStack(alignment: .leading) {
                    Text("120").padding(.bottom, 8)
                    Text("Act 3")
                }
                
                Spacer()

                NavigationLink(destination: AchievementsScreen()) {
                    WebImage(url: URL(string: imageUrl))
                        .placeholder(Image(systemName: "photo"))
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(.top, 8)
                                                .frame(width: 48, height: 48, alignment: .center)
                    
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
        
            .padding(.horizontal, 16)
    }
}
