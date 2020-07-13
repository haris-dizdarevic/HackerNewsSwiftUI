import Combine

class ItemApiClient: APIClient {
    func getTopStoriesIDS() -> AnyPublisher<[Int], Error> {
        callApi(using: .get, with: nil, for: "topstories.json")
            .map(\.value)
            .eraseToAnyPublisher()
    }

    func getItem(with id: Int) -> AnyPublisher<Item, Error> {
        callApi(using: .get, with: nil, for: "item/\(id).json").map(\.value).eraseToAnyPublisher()
    }
}
