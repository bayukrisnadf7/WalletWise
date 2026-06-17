import SwiftUI
import Combine

// Mark Tabview
enum AppTab {
    case dashboard
    case transaction
    case education
}

// Mark Route
enum DashboardRoute: Hashable {
    case allTransactions
    case transactionDetail(id: UUID)
    case statistics
    case addTransaction
    case editTransaction(id: UUID)
}

enum TransactionRoute: Hashable {
    case newTransaction
}

enum EducationRoute: Hashable {
    case articleDetail(id: UUID)
}


@MainActor
final class AppRouter: ObservableObject {
    @Published var selectedTab: AppTab = .dashboard
    
    @Published var dashboardPath = NavigationPath()
    @Published var transactionPath = NavigationPath()
    @Published var educationPath = NavigationPath()
    
}

