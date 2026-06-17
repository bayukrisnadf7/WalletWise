import SwiftUI


public struct HeaderHomeView: View {
    public var body: some View {
        HStack {
            Text("Wallet Wise")
                .font(Font.title).bold(true)
                .foregroundStyle(Color("PrimaryBlue"))
            
            Spacer()
            
//            Image("logo")
//                .resizable()
//                .frame(width: 55, height: 55)
        }
    }
}

#Preview {
    HeaderHomeView()
}
