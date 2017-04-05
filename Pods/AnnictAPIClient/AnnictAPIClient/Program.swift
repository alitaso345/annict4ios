struct Program : JSONDecodable {
    let id: Int
    let started: String
    let isRebroadcast: Bool
    let channel: Channel
    let work: Work
    let episode: Episode

    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard  let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "id",
                actualValue: dictionary["id"])
        }

        guard  let started = dictionary["started_at"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "started_at",
                actualValue: dictionary["started_at"])
        }

        guard  let isRebroadcast = dictionary["is_rebroadcast"] as? Bool else {
            throw JSONDecodeError.missingValue(
                key: "is_rebroadcast",
                actualValue: dictionary["is_rebroadcast"])
        }

        guard let channelObject = dictionary["channel"] else {
            throw JSONDecodeError.missingValue(
                key: "channel",
                actualValue: dictionary["channel"])
        }

        guard let workObject = dictionary["work"] else {
            throw JSONDecodeError.missingValue(
                key: "work",
                actualValue: dictionary["work"])
        }

        if let episodeObject = dictionary["episode"] {
            var episodeJSON = episodeObject as? [String : Any]
            episodeJSON?["work"] = workObject
            self.episode = try Episode(json: episodeJSON as Any)
        } else {
            throw JSONDecodeError.missingValue(
                key: "episode",
                actualValue: dictionary["episode"])
        }

        self.id = id
        self.started = started
        self.isRebroadcast = isRebroadcast
        self.channel = try Channel(json: channelObject)
        self.work = try Work(json: workObject)
    }
}
