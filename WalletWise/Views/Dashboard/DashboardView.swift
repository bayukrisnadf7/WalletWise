import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        VStack (spacing: 24) {
            
            HeroDashboardView()
            
            HeroDashboardView()
            
            StatisticDashboardView()
            
            HistoryDashboardView()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    HomeView()
}
