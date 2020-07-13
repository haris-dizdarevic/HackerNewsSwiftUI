import Foundation

struct Item: Codable, Identifiable {
    var id: Int
    var deleted: Bool?
    var type: String
    var by: String?
    var time: TimeInterval
    var text: String?
    var dead: Bool?
    var parent: Int?
    var kids: [Int]?
    var url: String?
    var score: Int?
    var title: String?
    var parts: [Int]?
    var descendants: Int?
}
