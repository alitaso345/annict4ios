import Foundation

protocol AnnictRequest {
    associatedtype Response: JSONDecodable

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Any? { get }
}

extension AnnictRequest {
    var baseURL: URL {
        return URL(string: "https://api.annict.com/v1")!
    }

    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true)
        var urlRequest = URLRequest(url: url)

        switch method {
        case .get :
            let dictionary = parameters as? [String : Any]
            let queryItems = dictionary?.map { key, value in
                return URLQueryItem(
                    name: key, value: String(describing: value))
            }
            components?.queryItems = queryItems
        case .post:
            let dictionary = parameters as? [String : Any]
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                urlRequest.httpBody = try JSONSerialization.data(
                    withJSONObject: dictionary!, options: [])
            } catch {
                print("http body error: \(error)")
            }
        }


        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }

    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode

        //status更新でPOSTしたとき必ずJSONへの変換でコケるのでその前に処理をする
        if case (200..<300)? = statusCode, self.path == "/me/statuses" {
            return try Response(json: ["statusCode": statusCode])
        }

        //取得したデータをJSONに変換
        let json = try JSONSerialization.jsonObject(with: data, options: [])

        if case (200..<300)? = statusCode {
            return try Response(json: json)
        } else {
            throw try AnnictAPIError(json: json)
        }
    }
}
