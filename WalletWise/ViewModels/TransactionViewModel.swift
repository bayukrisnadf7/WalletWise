import Foundation
import Observation
import SwiftData

@Observable
final class TransactionViewModel {
    
    var amountValue: Double = 0
    var amountText: String = ""
    var note: String = ""
    var selectedCategory: CategoryModel?
    var date: Date = .now
    
    func saveTransaction(context: ModelContext) throws {
        
        guard amountValue > 0 else {
            return
        }
        
        let transaction = TransactionModel(
            amount: amountValue,
            category: selectedCategory?.title ?? "",
            note: note,
            transactionDate: date
        )
        
        context.insert(transaction)
        
        try context.save()
        
    }
    
    func calculateTotal(
        transactions: [TransactionModel]
    ) -> Double {
        
        transactions.reduce(0) { total, transaction in
            total + transaction.amount
        }
    }
    
    func resetForm() {
        amountText = ""
        amountValue = 0
        note = ""
        selectedCategory = nil
        date = .now
    }
    
    func updateTransaction(
        _ transaction: TransactionModel,
        context: ModelContext
    ) throws {
        
        guard amountValue > 0 else { return }
        
        transaction.amount = amountValue
        transaction.category = selectedCategory?.title ?? ""
        transaction.note = note
        transaction.transactionDate = date
        
        try context.save()
    }
    
    func deleteTransaction(
        _ transaction: TransactionModel,
        context: ModelContext
    ) throws {
        
        context.delete(transaction)
        
        try context.save()
    }
    
    
}
