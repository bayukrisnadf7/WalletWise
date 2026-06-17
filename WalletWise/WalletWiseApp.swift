import SwiftUI
import SwiftData

@main
struct WalletWiseApp: App {

    @StateObject private var router = AppRouter()
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            Group {
                if showSplash {
                    SplashView()
                } else {
                    MainTabView()
                }
            }
            .environmentObject(router)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut) {
                        showSplash = false
                    }
                }
            }
        }
        .modelContainer(for: TransactionModel.self)
    }
}
