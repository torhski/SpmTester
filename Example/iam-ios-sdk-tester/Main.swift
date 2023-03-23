
import SwiftUI
import Alamofire
import iam_ios_sdk_tester

let appId = "appef6720db-cdfb-475d-8f49-703782c2b766"

@main
struct ImportAppApp: App {
    @State var text = ""
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                
                
                Core.initialize(CoreConfiguration(appId, "ak", "t", "rt"))
                
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }

    }
}

