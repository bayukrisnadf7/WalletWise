import Foundation

struct CategoryModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
    
    static let categories: [CategoryModel] = [
        .init(title: "Food", icon: "fork.knife"),
        .init(title: "Transport", icon: "car.fill"),
        .init(title: "Shopping", icon: "bag.fill"),
        .init(title: "Health", icon: "heart.fill"),
        .init(title: "Entertainment", icon: "doc.text.fill"),
        .init(title: "Education", icon: "book.fill"),
    ]
}
