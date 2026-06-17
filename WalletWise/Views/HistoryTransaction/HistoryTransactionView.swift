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
                        Category (title: category.title, icon: category.icon, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
            }
            
            Spacer().frame(height: 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if !groupedTransactions.isEmpty {

                        ForEach(groupedTransactions) { section in

                            Text(
                                TransactionDateHelper.sectionTitle(for: section.date)
                            )
                            .font(.title3.bold())

                            VStack(spacing: 16) {

                                ForEach(section.transactions) { transaction in

                                    let color = ColorCategoryHelper.color(
                                        for: transaction.category
                                    )

                                    HStack(spacing: 12) {

                                        Image(
                                            systemName: CategoryHelper.icon(
                                                for: transaction.category
                                            )
                                        )
                                        .padding(10)
                                        .background(
                                            Circle()
                                                .fill(color.opacity(0.15))
                                        )
                                        .foregroundStyle(color)

                                        VStack(
                                            alignment: .leading,
                                            spacing: 4
                                        ) {

                                            Text(transaction.category)
                                                .font(.headline.bold())

                                            Text(transaction.note)
                                                .font(.subheadline)
                                                .foregroundStyle(.secondary)

                                            Text(
                                                transaction.transactionDate.formatted(
                                                    date: .omitted,
                                                    time: .shortened
                                                )
                                            )
                                            .font(.caption)
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

                    } else {

                        ContentUnavailableView {
                            Label(
                                "No data available",
                                systemImage: "magnifyingglass"
                            )
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .navigationTitle(Text("History Transaction"))
    }
    
    private var filteredTransactions: [TransactionModel] {
        TransactionFilter.filter(
            transactions: transactions,
            searchText: searchText,
            selectedCategory: selectedCategory
        )
    }

    private var groupedTransactions: [TransactionSection] {
        TransactionFilter.groupByDate(
            transactions: filteredTransactions
        )
    }
}
