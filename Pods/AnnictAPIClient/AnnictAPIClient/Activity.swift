struct Activity : JSONDecodable {
    let id: Int
    let user: User
    let work: Work
    let action: String
    let createdAt: String

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard  let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }

        guard let userObject = dictionary["user"] else {
            throw JSONDecodeError.missingValue(key: "user", actualValue: dictionary["user"])
        }

        guard let workObject = dictionary["work"] else {
            throw JSONDecodeError.missingValue(key: "work", actualValue: dictionary["work"])
        }

        guard let action = dictionary["action"] as? String else {
            throw JSONDecodeError.missingValue(key: "action", actualValue: dictionary["action"])
        }

        guard let createdAt = dictionary["created_at"] as? String else {
            throw JSONDecodeError.missingValue(key: "created_at", actualValue: dictionary["created_at"])
        }

        self.id = id
        self.user = try User(json: userObject)
        self.work = try Work(json: workObject)
        self.action = action
        self.createdAt = createdAt
    }
}
