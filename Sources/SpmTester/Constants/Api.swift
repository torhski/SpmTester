import Foundation


enum EndpointPath: String {
    case register = "register"
    case achievements = "achievement"
    case report = ""
}


// TODO modify
struct AuidRegisterResponse: Codable {
    let uuid: String
}

struct AchievementsResponse: Codable {
    let appId: String
    let id: String
    let targetValue: String
}
