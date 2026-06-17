import SwiftUI

public struct HeroHomeView: View {
    public var body: some View {
        
        VStack (alignment: .leading) {
            Text ("TOTAL PENGELUARAN BULAN INI")
                .font(Font.subheadline.bold())
            
            HStack  {
                VStack (alignment: .leading) {
                    Text ("Rp. 4.250.000")
                        .font(Font.largeTitle.bold())
                    
                    Text ("12% lebih tinggi dari bulan lalu")
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

#Preview {
    HeroHomeView()
}
