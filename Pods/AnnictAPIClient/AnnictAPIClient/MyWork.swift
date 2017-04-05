import Foundation

struct MyWork : JSONDecodable {
    let id: Int
    let title: String
    let title_kana: String
    let media: String
    let mediaText: String
    let released: String
    let releasedAbout: String
    let officialSiteURL: String
    let wikipediaURL: String
    let twitterUsername: String
    let twitterHashtag: String
    let episodesCount: Int
    let watchersCount: Int
    let seasonName: String
    let seasonNameText: String
    let status: Status

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }

        guard let title = dictionary["title"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "title",
                actualValue: dictionary["title"])
        }

        guard let title_kana = dictionary["title_kana"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "title_kana",
                actualValue: dictionary["title_kana"])
        }

        guard let media = dictionary["media"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "media",
                actualValue: dictionary["media"])
        }

        guard let mediaText = dictionary["media_text"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "media_text",
                actualValue: dictionary["media_text"])
        }

        guard let released = dictionary["released_on"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "released_on",
                actualValue: dictionary["released_on"])
        }

        guard let releasedAbout = dictionary["released_on_about"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "released_on_about",
                actualValue: dictionary["released_on_about"])
        }

        guard let officialSiteURL = dictionary["official_site_url"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "official_site_url",
                actualValue: dictionary["official_site_url"])
        }

        guard let wikipediaURL = dictionary["wikipedia_url"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "wikipedia_url",
                actualValue: dictionary["wikipedia_url"])
        }

        guard let twitterUsername = dictionary["twitter_username"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "twitter_username",
                actualValue: dictionary["twitter_username"])
        }

        guard let twitterHashtag = dictionary["twitter_hashtag"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "twitter_hashtag",
                actualValue: dictionary["twitter_hashtag"])
        }

        guard let episodesCount = dictionary["episodes_count"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "episodes_count",
                actualValue: dictionary["episodes_count"])
        }

        guard let watchersCount = dictionary["watchers_count"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "watchers_count",
                actualValue: dictionary["watchers_count"])
        }

        guard let seasonName = dictionary["season_name"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "season_name",
                actualValue: dictionary["season_name"])
        }

        guard let seasonNameText = dictionary["season_name_text"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "season_name_text",
                actualValue: dictionary["season_name_text"])
        }

        guard let statusObject = dictionary["status"] as? [String : String] else {
            throw JSONDecodeError.missingValue(
                key: "status",
                actualValue: dictionary["status"])
        }

        guard let kind = statusObject["kind"] else {
            throw JSONDecodeError.missingValue(key: "kind", actualValue: statusObject["kind"])
        }

        self.id = id
        self.title = title
        self.title_kana = title_kana
        self.media = media
        self.mediaText = mediaText
        self.released = released
        self.releasedAbout = releasedAbout
        self.officialSiteURL = officialSiteURL
        self.wikipediaURL = wikipediaURL
        self.twitterUsername = twitterUsername
        self.twitterHashtag = twitterHashtag
        self.episodesCount = episodesCount
        self.watchersCount = watchersCount
        self.seasonName = seasonName
        self.seasonNameText = seasonNameText
        self.status = Status(kind: kind)!
    }
}
