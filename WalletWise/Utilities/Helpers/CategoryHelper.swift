import Foundation

struct CategoryHelper {
    static func icon(for category: String) -> String {
        CategoryModel.categories.first {
            $0.title == category
        }?.icon ?? "questionmark.circle"
    }
}
