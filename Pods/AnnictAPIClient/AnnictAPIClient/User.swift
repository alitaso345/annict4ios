struct User :JSONDecodable {
    let id: Int
    let username: String
    let name: String
    let description: String
    let url: String?
    let avatarURL: String
    let backgroundImageURL: String
    let recordsCount: Int
    let createdAt: String

    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard  let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }

        guard let username = dictionary["username"] as? String else {
            throw JSONDecodeError.missingValue(key: "username", actualValue: dictionary["username"])
        }

        guard let name = dictionary["name"] as? String else {
            throw JSONDecodeError.missingValue(key: "name", actualValue: dictionary["name"])
        }

        guard let description = dictionary["description"] as? String else {
            throw JSONDecodeError.missingValue(key: "description", actualValue: dictionary["description"])
        }

        if let url = dictionary["user"] as? String {
            self.url = url
        } else {
            self.url = nil
        }

        guard let avatarURL = dictionary["avatar_url"] as? String else {
            throw JSONDecodeError.missingValue(key: "avatar_url", actualValue: dictionary["avatar_url"])
        }

        guard let backgroundImageURL = dictionary["background_image_url"] as? String else {
            throw JSONDecodeError.missingValue(key: "background_image_url", actualValue: dictionary["background_image_url"])
        }

        guard let recordsCount = dictionary["records_count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "records_count", actualValue: dictionary["records_count"])
        }

        guard let createdAt = dictionary["created_at"] as? String else {
            throw JSONDecodeError.missingValue(key: "created_at", actualValue: dictionary["created_at"])
        }

        self.id = id
        self.username = username
        self.name = name
        self.description = description
        self.avatarURL  = avatarURL
        self.backgroundImageURL = backgroundImageURL
        self.recordsCount = recordsCount
        self.createdAt = createdAt
    }
}
