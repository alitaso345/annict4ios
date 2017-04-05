import Foundation

struct Work : JSONDecodable {
    let id: Int
    let title: String
    let title_kana: String
    let media: String
    let media_text: String
    let released_on: String
    let released_on_about: String
    let official_site_url: String
    let wikipedia_url: String
    let twitter_username: String
    let twitter_hashtag: String
    let episodes_count: Int
    let watchers_count: Int
    let season_name: String
    let season_name_text: String

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

        guard let media_text = dictionary["media_text"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "media_text",
                actualValue: dictionary["media_text"])
        }

        guard let released_on = dictionary["released_on"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "released_on",
                actualValue: dictionary["released_on"])
        }

        guard let released_on_about = dictionary["released_on_about"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "released_on_about",
                actualValue: dictionary["released_on_about"])
        }

        guard let official_site_url = dictionary["official_site_url"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "official_site_url",
                actualValue: dictionary["official_site_url"])
        }

        guard let wikipedia_url = dictionary["wikipedia_url"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "wikipedia_url",
                actualValue: dictionary["wikipedia_url"])
        }

        guard let twitter_username = dictionary["twitter_username"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "twitter_username",
                actualValue: dictionary["twitter_username"])
        }

        guard let twitter_hashtag = dictionary["twitter_hashtag"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "twitter_hashtag",
                actualValue: dictionary["twitter_hashtag"])
        }

        guard let episodes_count = dictionary["episodes_count"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "episodes_count",
                actualValue: dictionary["episodes_count"])
        }

        guard let watchers_count = dictionary["watchers_count"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "watchers_count",
                actualValue: dictionary["watchers_count"])
        }

        guard let season_name = dictionary["season_name"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "season_name",
                actualValue: dictionary["season_name"])
        }

        guard let season_name_text = dictionary["season_name_text"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "season_name_text",
                actualValue: dictionary["season_name_text"])
        }

        self.id = id
        self.title = title
        self.title_kana = title_kana
        self.media = media
        self.media_text = media_text
        self.released_on = released_on
        self.released_on_about = released_on_about
        self.official_site_url = official_site_url
        self.wikipedia_url = wikipedia_url
        self.twitter_username = twitter_username
        self.twitter_hashtag = twitter_hashtag
        self.episodes_count = episodes_count
        self.watchers_count = watchers_count
        self.season_name = season_name
        self.season_name_text = season_name_text

    }
}
