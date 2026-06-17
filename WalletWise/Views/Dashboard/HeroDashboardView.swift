import SwiftUI
import SwiftData

public struct HeroDashboardView: View {
    
    // query used for get data from SwiftData
    @Query
    private var transaction: [TransactionModel]
    
    // this function from swiftui this name is computed property
    private var totalExpense: Double {
        transaction.reduce(0) { $0 + $1.amount }
    }
    
    public var body: some View {
        VStack (alignment: .leading) {
            Text ("TOTAL EXPENSES FOR THIS MONTH")
                .font(Font.subheadline.bold())
            
            HStack  {
                VStack (alignment: .leading) {
                    Text(
                        totalExpense,
                        format: .currency(code: "IDR")
                    )
                    .font(.largeTitle.bold())
                    
                    Text ("12% higher than last month")
                        .padding(6)
                        .font(Font.subheadline.bold())
                        .background(
                            RoundedRectangle (cornerRadius: 12)
                                .fill(Color.white.opacity(0.1))
                        )
                }
                
                Spacer()
                
                Image("logo")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.white.opacity(0.5))
            }
            
            
        }
        .frame(maxWidth: 400, maxHeight: 130, alignment: .leading)
        .padding()
        .background(Color("PrimaryBlue"))
        .cornerRadius(20)
        .foregroundStyle(Color.white)
        
        
        
        
    }
}
