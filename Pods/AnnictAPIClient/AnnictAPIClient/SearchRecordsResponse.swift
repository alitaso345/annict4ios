struct SearchRecordsResponse : JSONDecodable {
    let total_count: Int
    let next_page: Int?
    let prev_page: Int?
    let records: [Record]

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

        guard let recordObjects = dictionary["records"] as? [Any] else {
            throw JSONDecodeError.missingValue(
                key: "records",
                actualValue: dictionary["records"])
        }

        let records = try recordObjects.map {
            return try Record(json: $0)
        }

        self.total_count = total_count
        self.records = records
    }
}
