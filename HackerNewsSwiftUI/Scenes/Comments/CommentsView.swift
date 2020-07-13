import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel: CommentsViewModel

    var body: some View {
        VStack {
            Text("Comments")
                .font(.headline)
                .padding()
            List(self.viewModel.comments, id: \.id) { comment in
                VStack(spacing: 2) {
                    Text(comment.text ?? "")
                    HStack {
                        Text("by \(comment.by ?? "")")
                            .font(.caption)
                        Spacer()
                        Text("\(comment.kids?.count ?? 0) replies")
                            .font(.caption)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(4)
                .shadow(radius: 1)
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
   static var previews: some View {
       CommentsView(
           viewModel: CommentsViewModel(
               comments: [Item(
                   id: 1, deleted: false, type: "comment", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://google.com", score: 123, title: "Title of the item", parts: nil, descendants: nil
               )]
           )
       )
   }
}
