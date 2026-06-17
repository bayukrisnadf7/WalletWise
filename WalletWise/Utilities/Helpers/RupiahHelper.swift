import Foundation

struct RupiahFormatter {
    
    static func format(_ value: String) -> String {
        let clean = value.replacingOccurrences(
            of: "[^0-9]",
            with: "",
            options: .regularExpression
        )
        
        guard !clean.isEmpty else { return "" }
        
        let number = Int(clean) ?? 0
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        
        return formatter.string(from: NSNumber(value: number)) ?? clean
    }
}
