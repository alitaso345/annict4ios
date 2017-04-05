struct Channel : JSONDecodable {
    let id: Int
    let name: String

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }

        guard let name = dictionary["name"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "name",
                actualValue: dictionary["name"])
        }

        self.id = id
        self.name = name
    }
}
