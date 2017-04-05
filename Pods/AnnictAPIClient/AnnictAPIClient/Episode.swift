struct Episode : JSONDecodable {
    let id: Int
    let number: String?
    let numberText: String
    let sortNumber: Int
    let title: String
    let recordsCount: Int
    let recordCommentsCount: Int
    let work: Work

    //自分と同じ型を使いたいけどstructだと使えないのでひとまずこれらの値は使わない
    //必要になったらclassにするかどうか考える
    //let prevEpisode: Episode?
    //let nextEpisode: Episode?

    init(json: Any) throws {
        guard let dictinary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let id = dictinary["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictinary["id"])
        }

        if let number = dictinary["number"] as? String {
            self.number = number
        } else {
            self.number = nil
        }

        guard let numberText = dictinary["number_text"] as? String else {
            throw JSONDecodeError.missingValue(key: "number_text", actualValue: dictinary["number_text"])
        }

        guard let sortNumber = dictinary["sort_number"] as? Int else {
            throw JSONDecodeError.missingValue(key: "sort_number", actualValue: dictinary["sort_number"])
        }

        guard let title = dictinary["title"] as? String else {
            throw JSONDecodeError.missingValue(key: "title", actualValue: dictinary["title"])
        }

        guard let recordsCount = dictinary["records_count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "records_count", actualValue: dictinary["records_count"])
        }

        guard let recordCommentsCount = dictinary["record_comments_count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "record_comment_count", actualValue: dictinary["record_comments_count"])
        }

        guard let workObject = dictinary["work"] else {
            throw JSONDecodeError.missingValue(key: "work", actualValue: dictinary["work"])
        }

        self.id = id
        self.numberText = numberText
        self.sortNumber = sortNumber
        self.title = title
        self.recordsCount = recordsCount
        self.recordCommentsCount = recordCommentsCount
        self.work = try Work(json: workObject)
    }
}
