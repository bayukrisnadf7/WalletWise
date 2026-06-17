import SwiftUI


struct DashboardNavigation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: DashboardRoute.self) { route in
                switch route {
                
                case .addTransaction:
                    TransactionView()
                    
                case .editTransaction(id: let id):
                    TransactionEditView(id: id)
                    
                case .allTransactions:
                    HistoryTransactionView()
                    
                case .transactionDetail(id: let id):
                    TransactionDetailView(id: id)
                    
                case .statistics:
                    StatisticView()
                    
                }
            }
    }
}


extension View {
    func dashboardNavigation() -> some View {
        modifier(DashboardNavigation())
    }
}
