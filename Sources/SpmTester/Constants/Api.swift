import Foundation


enum EndpointPath: String {
    case register = "/register/user"
    case achievements = "/achievements"
    case report = ""
}


// TODO modify
struct AuidRegisterResponse: Codable {
    let reason: String
    let result: String
}

struct AchievementsResponse: Codable {
    let actionId: String
    let createdAt: String
    let targetValue: String
}
