import SwiftUI
import SwiftData

public struct HistoryDashboardView: View {
    @EnvironmentObject var router: AppRouter
    
    // propery from swift data to get data and this data have to sortir
    @Query(
        sort: \TransactionModel.transactionDate,
        order: .reverse
    )
    private var transactions: [TransactionModel]
    
    // this function used to get data from transaction model just get 3 data
    private var latestTransactions: [TransactionModel] {
        Array(transactions.prefix(3))
    }
    
    public var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text ("Latest Transactions")
                    .font(Font.title3.bold())
                
                Spacer()
                
                Button {
                    router.dashboardPath.append(DashboardRoute.allTransactions)
                } label: {
                    Text ("More")
                        .foregroundStyle(Color("PrimaryBlue"))
                        .font(Font.subheadline)
                }
                
            }
            if !latestTransactions.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(Array(latestTransactions.enumerated()), id: \.element.id) { index, transaction in
                        let color = ColorCategoryHelper.color(for: transaction.category)
                        Button {
                            router.dashboardPath.append(
                                DashboardRoute.transactionDetail(id: transaction.id)
                            )
                            
                        } label: {
                            
                            HStack (spacing: 12) {
                                
                                Image(systemName: CategoryHelper.icon(for: transaction.category))
                                    .padding(10)
                                    .background(
                                        Circle()
                                            .fill(color.opacity(0.1))
                                    )
                                    .foregroundStyle(color)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    Text(transaction.category)
                                        .font(.headline.bold())
                                    
                                    Text (transaction.note)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    
                                    Text(
                                        transaction.transactionDate.formatted(
                                            date: .abbreviated,
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
                        .buttonStyle(.plain)
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
    }
}
