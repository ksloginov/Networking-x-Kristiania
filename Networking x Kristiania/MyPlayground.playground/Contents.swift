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








extension String {
    
    func date(dateFormat: String = "dd.MM.yyyy HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.date(from: self)
    }
    
    var urlEncoded: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
    }
    
    var capitalizeFirstLetter: String {
        if self.isEmpty {
            return self
        }

        let first = self.prefix(1).uppercased()
        let rest = String(self.dropFirst())
        return first + rest
    }
    
    func substring(_ startIndex: Int, length: Int) -> String {
        return self.substring(startIndex, endIndex: startIndex + length - 1)
    }
    
    func substring(_ startIndex: Int, endIndex: Int) -> String {
        let leftBorder = min(max(startIndex, 0), self.count)
        let rightBorder = min(endIndex + 1, self.count)
        if leftBorder > rightBorder {
            return self
        }

        return String(self.prefix(rightBorder).dropFirst(leftBorder))
    }
}

"2021-09-13T16:35:06.0000000Z".date(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ")










"abc abc".capitalizeFirstLetter
