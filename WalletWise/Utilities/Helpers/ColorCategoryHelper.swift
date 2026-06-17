import SwiftUI

struct ColorCategoryHelper {
    
    private static let categoryColors: [String: Color] = [
        "Food": .orange,
        "Transport": .blue,
        "Shopping": .purple,
        "Health": .green,
        "Entertainment": .pink,
        "Education": .indigo
    ]
    
    static func color(for category: String) -> Color {
        categoryColors[category] ?? .gray
    }
}
