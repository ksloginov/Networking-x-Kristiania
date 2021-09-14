import UIKit






struct User: Codable {
    var firstName: String
    var age: Int?
    var dayOfBirth: Int
    
    enum CodingKeys: String, CodingKey {
        case age, dayOfBirth
        case firstName = "first_name"
    }
}

let data = "{\"first_name\":\"Konstantin\",\"last_name\":\"Loginov\",\"dayOfBirth\":31}".data(using: .utf8)!

let decoder = JSONDecoder()

let parsedUser = try decoder.decode(User.self, from: data)
