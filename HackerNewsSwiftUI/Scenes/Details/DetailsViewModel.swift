import Combine

class DetailsViewModel: ObservableObject {
    private let apiClient: ItemApiClient
    private var disposables = Set<AnyCancellable>()
    
    let item: Item
    @Published var comments: [Item] = []

    init(item: Item, apiClient: ItemApiClient = ItemApiClient()) {
        self.item = item
        self.apiClient = apiClient
    }

    func fetchComents() {
        if let commentIds = item.kids {
            commentIds.forEach { [weak self] (id) in
                self?.apiClient.getItem(with: id).sink(
                    receiveCompletion: { (_) in },
                    receiveValue: { (item) in
                        self?.comments.append(item)
                    }
                ).store(in: &disposables)
            }
        }
    }
}
