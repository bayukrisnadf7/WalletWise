import SwiftUI


public struct StatisticHomeView: View {
    @EnvironmentObject var router: AppRouter
    
    public var body: some View {
        
        VStack (alignment: .leading, spacing: 20) {
            
            HStack {
                Text ("Statistik")
                    .font(Font.title3.bold())
                
                Spacer()
                
                Button {
                    router.dashboardPath.append(DashboardRoute.statistics)
                } label: {
                    Text ("Lihat Detail")
                        .foregroundStyle(Color("PrimaryBlue"))
                        .font(Font.subheadline)
                }
                
            }
            
            VStack (spacing: 16) {
                VStack(alignment: .leading) {
                    Text ("Jajan")
                        .font(Font.headline.bold())
                    ProgressView(value: 0.4)
                        .tint(Color("PrimaryBlue"))
                }
                
                VStack(alignment: .leading) {
                    Text ("Transport")
                        .font(Font.headline.bold())
                    ProgressView(value: 0.6)
                        .tint(Color.green)
                }
                
                VStack(alignment: .leading) {
                    Text ("Kebutuhan lain")
                        .font(Font.headline.bold())
                    ProgressView(value: 0.2)
                        .tint(Color.red.opacity(0.4))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            )
            
            
        }
        
        
    }
}

#Preview {
    StatisticHomeView()
}
