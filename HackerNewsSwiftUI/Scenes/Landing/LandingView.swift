import SwiftUI
import Combine

struct LandingView: View {
    @ObservedObject var viewModel: LandingViewModel
    var body: some View {
        NavigationView {
            List(viewModel.topStories) { story in
                TopStoryRow(story: story)
            }.onAppear {
                self.viewModel.getTopStories()
                UITableView.appearance().separatorStyle = .none
            }.navigationBarTitle("Top Stories")
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LandingViewModel()
        vm.topStories = [
            Item(id: 1, deleted: false, type: "topstory", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://facebook.com", score: 123, title: "Title of the item number 1", parts: nil, descendants: nil),
            Item(id: 2, deleted: false, type: "topstory", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://google.com", score: 123, title: "Title of the item", parts: nil, descendants: nil),
            Item(id: 3, deleted: false, type: "topstory", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://google.com", score: 123, title: "Title of the item", parts: nil, descendants: nil),
            Item(id: 4, deleted: false, type: "topstory", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://google.com", score: 123, title: "Title of the item", parts: nil, descendants: nil)
        ]
        return LandingView(viewModel: vm)
    }
}
