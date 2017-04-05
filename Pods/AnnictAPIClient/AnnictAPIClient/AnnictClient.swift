import Foundation

class AnnictClient {
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    let accessToken: String

    init(accessToken: String) {
        self.accessToken = accessToken
    }

    func send<Request : AnnictRequest>(
        request: Request,
        completion: @escaping (Result<Request.Response, AnnictClientError>) -> Void) {

        var urlRequest = request.buildURLRequest()
        urlRequest.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: urlRequest) {
            data, response, error in

            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as AnnictAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response \(data) \(response) \(error)")
            }
        }

        task.resume()
    }
}
