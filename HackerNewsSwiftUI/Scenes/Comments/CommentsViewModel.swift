import SwiftUI

class CommentsViewModel: ObservableObject {
    let comments: [Item]

    init(comments: [Item]) {
        self.comments = comments
    }
}
