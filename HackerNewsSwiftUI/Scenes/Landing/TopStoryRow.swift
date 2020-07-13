import SwiftUI

struct TopStoryRow: View {
    var story: Item
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 50, height: 80, alignment: .center)
                        Text("\(story.score ?? 0)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(story.title ?? "")
                            .font(.body)
                            .minimumScaleFactor(0.75)
                            .lineLimit(2)
                        Text("(\(story.url ?? ""))")
                            .font(.caption)
                            .minimumScaleFactor(0.75)
                            .lineLimit(2)
                    }
                    Spacer()
                }
            }
            .background(Color.white)
            .border(Color.black.opacity(0.1), width: 1)
            .cornerRadius(6)
            .shadow(radius: 2)
            NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(item: story))) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
        }

    }
}

struct TopStoryRow_Previews: PreviewProvider {
    static var previews: some View {
        return TopStoryRow(story: Item(id: 1, deleted: false, type: "topstory", by: "User", time: Date().timeIntervalSince1970, text: "Some ancient writing", dead: false, parent: nil, kids: nil, url: "https://google.com", score: 123, title: "Title of the item", parts: nil, descendants: nil))
    }
}
