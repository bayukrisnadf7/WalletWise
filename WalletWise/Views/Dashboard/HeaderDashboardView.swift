import SwiftUI


public struct HeaderDashboardView: View {
    @EnvironmentObject var router: AppRouter
    
    public var body: some View {
        HStack {
            Text("Wallet Wise")
                .font(Font.title).bold(true)
                .foregroundStyle(Color("PrimaryBlue"))
            
            Spacer()
            
            Button {
                router.dashboardPath.append(DashboardRoute.addTransaction)
            } label: {
                Image(systemName: "plus")
                    .font(.title.bold())
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.primaryBlue)
            }
            .buttonStyle(.glass)
            
        }
    }
}

#Preview {
    HeaderDashboardView()
}

