struct SearchProgramsResponse : JSONDecodable {
    let total_count: Int
    let next_page: Int?
    let prev_page: Int?
    let programs: [Program]

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let total_count = dictionary["total_count"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "total_count",
                actualValue: dictionary["total_count"])
        }

        if let next_page = dictionary["next_page"] as? Int {
            self.next_page = next_page
        } else {
            self.next_page = nil
        }

        if let prev_page = dictionary["prev_page"] as? Int {
            self.prev_page = prev_page
        } else {
            self.prev_page = nil
        }

        guard let programsObjects = dictionary["programs"] as? [Any] else {
            throw JSONDecodeError.missingValue(
                key: "programs",
                actualValue: dictionary["programs"])
        }

        let programs = try programsObjects.map {
            return try Program(json: $0)
        }

        self.total_count = total_count
        self.programs = programs
    }
}
