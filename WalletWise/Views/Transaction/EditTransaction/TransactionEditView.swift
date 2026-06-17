import SwiftUI
import SwiftData

struct TransactionEditView: View {
    
    let id: UUID
    
    @Environment(\.modelContext) private var context
    @EnvironmentObject var route: AppRouter
    
    @Query private var transactions: [TransactionModel]
    
    @State private var tvm = TransactionViewModel()
    
    private var transaction: TransactionModel? {
        transactions.first(where: { $0.id == id })
    }
    
    var body: some View {
        
        if let transaction {
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    HeroTransactionView(tvm: tvm)
                    
                    AnotherInputTransactionView(tvm: tvm)
                    
                    Button {
                        
                        do {
                            try tvm.updateTransaction(
                                transaction,
                                context: context
                            )
                            
                            route.dashboardPath.removeLast()
                            
                        } catch {
                            print(error)
                        }                    } label: {
                            
                            Text("Update Transaction")
                                .foregroundStyle(.white)
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity)
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color("PrimaryBlue"))
                                )
                        }
                }
                .padding()
            }
            .background(Color.gray.opacity(0.1))
            .navigationTitle("Edit Transaction")
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                tvm.amountValue = transaction.amount
                tvm.amountText = RupiahFormatter.format(
                    String(Int(transaction.amount))
                )

                tvm.note = transaction.note

                tvm.selectedCategory = CategoryModel.categories.first {
                    $0.title == transaction.category
                }

                tvm.date = transaction.transactionDate
            }
            
        } else {
            
            ContentUnavailableView(
                "Transaction Not Found",
                systemImage: "tray"
            )
        }
    }
    
    
}
