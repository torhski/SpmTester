import Foundation


enum EndpointPath: String {
    case Register = "/register/user"
}


// TODO modify
struct AuidRegisterResponse: Codable {
    let reason: String
    let result: String
}
