import SwiftUI
import SwiftData

public struct StatisticDashboardView: View {
    @EnvironmentObject var router: AppRouter
    
    @Query(sort: \TransactionModel.transactionDate, order: .reverse)
    
    private var transactions: [TransactionModel]
    
    
    public var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            
            HStack {
                Text ("Statistics")
                    .font(Font.title3.bold())
                
                Spacer()
                
                Button {
                    router.dashboardPath.append(DashboardRoute.statistics)
                } label: {
                    Text ("More")
                        .foregroundStyle(Color("PrimaryBlue"))
                        .font(Font.subheadline)
                }
                
            }
            
            VStack(spacing: 16) {
                if !transactions.isEmpty {
                    ForEach(Array(top3Categories.enumerated()), id: \.element.category) { index, item in
                        
                        let color = ColorCategoryHelper.color(for: item.category)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            HStack(spacing: 8) {
                                Image(systemName: CategoryHelper.icon(for: item.category))
                                    .foregroundStyle(color)
                                
                                Text(item.category)
                                    .font(.headline.bold())
                            }
                            
                            ProgressView(value: percentage(item.total))
                                .tint(color)
                            
                            Text("\(Int(percentage(item.total) * 100))%")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                } else {
                    ContentUnavailableView {
                        Label("No data available", systemImage: "magnifyingglass")
                            .font(.title3)
                            .foregroundStyle(Color.secondary)
                    }
                }
                
            }
            .padding()
            .cardStyle()
            
        }
        
        
    }
    
    var totalExpense: Double {
        transactions.reduce(0) { $0 + $1.amount }
    }
    
    var top3Categories: [(category: String, total: Double)] {
        groupedByCategory
            .sorted { $0.value > $1.value }
            .prefix(3)
            .map { ($0.key, $0.value) }
    }
    
    var groupedByCategory: [String: Double] {
        Dictionary(grouping: transactions, by: { $0.category })
            .mapValues { items in
                items.reduce(0) { $0 + $1.amount }
            }
    }
    
    func percentage(_ total: Double) -> Double {
        guard totalExpense > 0 else { return 0 }
        return total / totalExpense
    }
    
    func icon(for category: String) -> String {
        CategoryModel.categories.first { $0.title == category }?.icon ?? "questionmark.circle"
    }
}

