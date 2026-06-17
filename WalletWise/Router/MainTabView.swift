import SwiftUI


struct MainTabView: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        TabView (selection: $router.selectedTab) {
            
            NavigationStack (path: $router.dashboardPath) {
                DashboardView()
                    .dashboardNavigation()
            }

            .tabItem {
                Label("Dashboard", systemImage: "house")
            }
            .tag(AppTab.dashboard)
            
            EducationView().tabItem {
                Label("Education", systemImage: "book")
            }
            .tag(AppTab.education)
        }
    }
}



