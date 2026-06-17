import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        VStack(spacing: 24) {
            HeaderDashboardView()
                .padding(.horizontal)
            
            HeroDashboardView()
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 24) {
                    StatisticDashboardView()
                    HistoryDashboardView()
                }
                .padding(.horizontal)
                .padding(.bottom, 100)
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top)
        .background(Color.gray.opacity(0.1))
    }
}

