import Foundation
import SwiftData

@Model
class TransactionModel {
    var id: UUID = UUID()
    var amount: Double
    var category: String
    var note: String
    var transactionDate: Date
    
    init(amount: Double, category: String, note: String, transactionDate: Date) {
        self.id = UUID()
        self.amount = amount
        self.category = category
        self.note = note
        self.transactionDate = transactionDate
    }
}
