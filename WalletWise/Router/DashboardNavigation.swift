import SwiftUI


struct HomeNavigation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: HomeRoute.self) { route in
                switch route {
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
    func homeNavigation() -> some View {
        modifier(HomeNavigation())
    }
}
