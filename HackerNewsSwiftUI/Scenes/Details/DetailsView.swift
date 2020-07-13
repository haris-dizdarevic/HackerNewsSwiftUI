 import SwiftUI

 struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    @State var showComments: Bool = false
    @State var showLoader: Bool = true
    var body: some View {
        LoadingView(isShowing: $showLoader) {
            GeometryReader { proxy in
                VStack {
                    WebView(
                        url: URL(string: self.viewModel.item.url!)!,
                        showLoader: self.$showLoader
                    )
                    NavigationLink(
                        destination: CommentsView(
                            viewModel: CommentsViewModel(comments: self.viewModel.comments)
                        )) {
                            Text("Comments")
                                .foregroundColor(.white)
                        }.frame(
                            width: proxy.size.width - 32,
                            height: 48,
                            alignment: .center
                        )
                        .background(Color.green)
                        .cornerRadius(4)
                        .padding(.bottom, 8)
                }
            }
            .navigationBarTitle("Details", displayMode: .inline)
            .onAppear() {
                self.viewModel.fetchComents()
            }
//            .sheet(isPresented: self.$showComments) {
//                CommentsView(viewModel: CommentsViewModel(comments: self.viewModel.comments))
//            }
        }
    }
    
 }

 struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(
            viewModel: DetailsViewModel(
                item: Item(
                    id: 1, deleted: false, type: "topstory", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://google.com", score: 123, title: "Title of the item", parts: nil, descendants: nil
                )
            )
        )
    }
 }
