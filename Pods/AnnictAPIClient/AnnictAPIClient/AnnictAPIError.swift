struct AnnictAPIError : JSONDecodable, Error {
    struct FieldError : JSONDecodable {
        let type: String
        let message: String
        let developer_message: String

        init(json: Any) throws {
            guard let dictionary = json as? [String : Any] else {
                throw JSONDecodeError.invalidFormat(json: json)
            }

            guard let type = dictionary["type"] as? String else {
                throw JSONDecodeError.missingValue(
                    key: "type",
                    actualValue: dictionary["type"])
            }

            guard let message = dictionary["message"] as? String else {
                throw JSONDecodeError.missingValue(
                    key: "message",
                    actualValue: dictionary["message"])
            }

            guard let developer_message = dictionary["developer_message"] as? String else {
                throw JSONDecodeError.missingValue(
                    key: "developer_message",
                    actualValue: dictionary["developer_message"])
            }

            self.type = type
            self.message = message
            self.developer_message = developer_message
        }
    }

    let fieldErrors: [FieldError]

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        let fieldErrorObjects = dictionary["errors"] as? [Any] ?? []
        let fieldErrors = try fieldErrorObjects.map {
            return try FieldError(json: $0)
        }

        self.fieldErrors = fieldErrors
    }
}
