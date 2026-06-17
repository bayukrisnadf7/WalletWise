import SwiftUI
import SwiftData
import Charts

public struct StatisticView: View {
    
    @Query(
        sort: \TransactionModel.transactionDate,
        order: .reverse
    )
    private var transactions: [TransactionModel]
    
    private var categoryExpenses: [(category: String, total: Double)] {
        Dictionary(grouping: transactions, by: \.category)
            .map { category, transactions in
                (
                    category: category,
                    total: transactions.reduce(0) { $0 + $1.amount }
                )
            }
            .sorted { $0.total > $1.total }
    }
    
    private var totalExpense: Double {
        transactions.reduce(0) { $0 + $1.amount }
    }
    
    func percentage(_ total: Double) -> Double {
        guard totalExpense > 0 else { return 0 }
        return total / totalExpense
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack {
                    Chart(
                        Array(categoryExpenses.enumerated()),
                        id: \.element.category
                    ) { index, item in
                        let color = ColorCategoryHelper.color(for: item.category)
                        SectorMark(
                            angle: .value("Amount", item.total),
                            innerRadius: .ratio(0.65),
                            angularInset: 2
                        )
                        .cornerRadius(8)
                        .foregroundStyle(color)
                    }
                    .frame(height: 300)
                    VStack {
                        Text("Total")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Text(
                            totalExpense,
                            format: .currency(code: "IDR")
                        )
                        .font(.title3.bold())
                    }
                }
                .frame(height: 300)
                
                Text ("Kategori Teratas")
                    .font(Font.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack( alignment: .center, spacing: 12) {
                    ForEach(categoryExpenses, id: \.category) { item in
                        
                        let color = ColorCategoryHelper.color(for: item.category)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                HStack(spacing: 12) {
                                    
                                    Image(systemName: CategoryHelper.icon(for: item.category))
                                        .foregroundStyle(color)
                                        .padding(10)
                                        .background(
                                            Circle()
                                                .fill(color.opacity(0.15))
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.category)
                                            .font(.headline.bold())
                                        
                                        Text("\(Int(percentage(item.total) * 100))%")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(
                                        item.total,
                                        format: .currency(code: "IDR")
                                    )
                                    .fontWeight(.semibold)
                                }
                                
                                ProgressView(value: percentage(item.total))
                                    .tint(color)
                            }
                            .padding()
                            .cardStyle()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
            .navigationTitle("Statistic Transaction")
        }
    }
}
