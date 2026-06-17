import Foundation

struct TransactionSection: Identifiable {
    let date: Date
    let transactions: [TransactionModel]

    var id: Date { date }
}
