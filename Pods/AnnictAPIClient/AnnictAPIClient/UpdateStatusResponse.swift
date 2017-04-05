struct UpdateStatusResponse : JSONDecodable {
    let statusCode: Int

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let statusCode = dictionary["statusCode"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "statusCode",
                actualValue: dictionary["statusCode"])
        }
        self.statusCode = statusCode
    }
}
