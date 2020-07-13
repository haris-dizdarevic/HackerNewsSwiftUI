import Foundation
import Combine

class APIClient {
    let baseURL = "https://hacker-news.firebaseio.com/v0"

    enum HTTPMethod: String {
        case post, get, delete, patch, put
    }

    func callApi<Model: Codable>(
        using method: HTTPMethod,
        with parameters: [String: Any]?,
        for path: String,
        headers: [String: String] = [:]
    ) -> AnyPublisher<Response<Model>, Error> {
        guard let url = URL(string: "\(baseURL)/\(path)") else {
            fatalError("URL is not in correct format")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        let decoder = JSONDecoder()

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Response<Model> in
                let value = try decoder.decode(Model.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .print()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
