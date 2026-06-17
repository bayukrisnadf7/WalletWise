import SwiftUI
import Combine

// Mark Tabview

enum AppTab {
    case home
    case transaction
    case education
}

// Mark Route

enum HomeRoute: Hashable {
    case allTransactions
    case transactionDetail(id: UUID)
    case statistics
}

enum TransactionRoute: Hashable {
    case newTransaction
}

enum EducationRoute: Hashable {
    case articleDetail(id: UUID)
}


@MainActor
final class AppRouter: ObservableObject {
    @Published var selectedTab: AppTab = .home
    
    @Published var homePath = NavigationPath()
    @Published var transactionPath = NavigationPath()
    @Published var educationPath = NavigationPath()
    
}

