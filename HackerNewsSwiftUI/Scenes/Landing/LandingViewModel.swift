import Combine

class LandingViewModel: ObservableObject, Identifiable {
    private let itemApiClient: ItemApiClient

    private var disposables = Set<AnyCancellable>()
    @Published var topStories: [Item] = []

    init(itemApiClient: ItemApiClient = ItemApiClient()) {
        self.itemApiClient = itemApiClient
    }

    func getTopStories() {
        if !topStories.isEmpty { return }
        itemApiClient.getTopStoriesIDS().sink(receiveCompletion: { _ in }) { [weak self] ids in
            guard let self = self else { return }
            ids.prefix(20).forEach { id in
                self.itemApiClient.getItem(with: id).sink(receiveCompletion: { _ in }) { [weak self] item in
                    self?.topStories.append(item)
                }.store(in: &self.disposables)
            }
        }.store(in: &disposables)
    }
}
