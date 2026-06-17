import SwiftUI


public struct HistoryHomeView: View {
    @EnvironmentObject var router: AppRouter
    
    public var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text ("Riwayat Terbaru")
                    .font(Font.title3.bold())
                
                Spacer()
                
                Button {
                    router.homePath.append(HomeRoute.allTransactions)
                } label: {
                    Text ("Lihat Semua")
                        .foregroundStyle(Color("PrimaryBlue"))
                        .font(Font.subheadline)
                }
                
            }
            
            ScrollView {
                VStack (alignment: .leading, spacing: 12) {
                    Button {
                        router.homePath.append(HomeRoute.transactionDetail(id: UUID()))
                    } label: {
                        HStack {
                            Image(systemName: "fork.knife")
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.gray.opacity(0.2))
                                )
                                .foregroundStyle(Color("PrimaryBlue"))
                            
                            VStack (alignment: .leading) {
                                Text("Makan Siang")
                                    .font(.headline.bold())
                                
                                Text("Hari Ini 12:45")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.gray)
                            }
                            
                            Spacer()
                            
                            Text ("-Rp. 12.000")
                                .foregroundStyle(Color.red)
                                .font(.headline.bold())
                                
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                        
                    }
                    
                    HStack {
                        Image(systemName: "fork.knife")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.2))
                            )
                            .foregroundStyle(Color("PrimaryBlue"))
                        
                        VStack (alignment: .leading) {
                            Text("Makan Siang")
                                .font(.headline.bold())
                            
                            Text("Hari Ini 12:45")
                                .font(.subheadline)
                                .foregroundStyle(Color.gray)
                        }
                        
                        Spacer()
                        
                        Text ("-Rp. 12.000")
                            .foregroundStyle(Color.red)
                            .font(.headline.bold())
                            
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                    
                    HStack {
                        Image(systemName: "fork.knife")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.2))
                            )
                            .foregroundStyle(Color("PrimaryBlue"))
                        
                        VStack (alignment: .leading) {
                            Text("Makan Siang")
                                .font(.headline.bold())
                            
                            Text("Hari Ini 12:45")
                                .font(.subheadline)
                                .foregroundStyle(Color.gray)
                        }
                        
                        Spacer()
                        
                        Text ("-Rp. 12.000")
                            .foregroundStyle(Color.red)
                            .font(.headline.bold())
                            
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                    
                    
                    
                    
                }
            }
            
            
        }
    }
}

#Preview {
    HistoryHomeView()
}
