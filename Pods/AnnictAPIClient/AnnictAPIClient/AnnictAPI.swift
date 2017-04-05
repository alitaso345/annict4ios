final class AnnictAPI {
    struct SearchWorks : AnnictRequest {
        typealias Response = SearchWorksResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/works"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchEpisodes : AnnictRequest {
        typealias Response = SearchEpisodesResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/episodes"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchRecords : AnnictRequest {
        typealias Response = SearchRecordsResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/records"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchUsers : AnnictRequest {
        typealias Response = SearchUsersResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/users"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchFollowingUsers : AnnictRequest {
        typealias Response = SearchUsersResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/following"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchFollowers : AnnictRequest {
        typealias Response = SearchUsersResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/followers"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchActivities : AnnictRequest {
        typealias Response = SearchActivitiesResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/activities"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchProfile : AnnictRequest {
        typealias Response = Profile

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/me"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchMyWorks : AnnictRequest {
        typealias Response = SearchMyWorksResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/me/works"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct SearchPrograms : AnnictRequest {
        typealias Response = SearchProgramsResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/me/programs"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct FollowingActivities : AnnictRequest {
        typealias Response = SearchActivitiesResponse

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/me/following_activities"
        }

        var parameters: Any? {
            return nil
        }
    }

    struct UpdateStatus : AnnictRequest {
        typealias Response = UpdateStatusResponse

        let workId: Int
        let kind: String

        var method: HTTPMethod {
            return .post
        }

        var path: String {
            return "/me/statuses"
        }

        var parameters: Any? {
            return [
                "work_id": workId,
                "kind": kind
            ]
        }
    }

    struct CreateRecord : AnnictRequest {
        typealias Response = CreateRecordResponse

        let episodeId: Int
        var comment: String = ""
        var rating: Int = 0

        var method: HTTPMethod {
            return .post
        }

        var path: String {
            return "/me/records"
        }

        var parameters: Any? {
            return [
                "episode_id": episodeId,
                "comment": comment,
                "rating": rating
            ]
        }
    }
}
