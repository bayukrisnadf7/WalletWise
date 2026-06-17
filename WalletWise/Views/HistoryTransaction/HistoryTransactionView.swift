import SwiftUI
import SwiftData

public struct HistoryTransactionView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: CategoryModel?
    
    @Query(
        sort: \TransactionModel.transactionDate,
        order: .reverse
    )
    
    private var transactions: [TransactionModel]
    
    public var body: some View {
        VStack {
            
            SearchView(searchText: $searchText)
            
            Spacer().frame(height: 20)
            
            ScrollView (.horizontal, showsIndicators: false){
                HStack (spacing: 16) {
                    ForEach (CategoryModel.categories, id: \.self) { category in
                        CategoryView (title: category.title, icon: category.icon, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
            }
            
            Spacer().frame(height: 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                    ForEach(transactions) { transaction in
                        
                        HStack {
                            
                            Image(systemName: CategoryHelper.icon(for: transaction.category))
                                .foregroundStyle(Color.primaryBlue)
                            
                            VStack(alignment: .leading) {
                                
                                Text(transaction.category)
                                    .font(.headline.bold())
                                
                                Text(
                                    transaction.transactionDate.formatted(
                                        date: .abbreviated,
                                        time: .shortened
                                    )
                                )
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            Text(
                                "-\(transaction.amount.formatted(.currency(code: "IDR")))"
                            )
                            .foregroundStyle(.red)
                            .font(.headline.bold())
                        }
                        .padding()
                        .cardStyle()
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .navigationTitle(Text("Riwayat Transaksi"))
    }
}
