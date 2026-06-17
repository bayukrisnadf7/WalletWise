import SwiftUI

struct HeroTransactionView: View {
    @Bindable var tvm: TransactionViewModel
    
    private var amountBinding: Binding<String> {
        Binding(
            get: { tvm.amountText },
            set: { tvm.amountText = $0 }
        )
    }
    
    var body: some View {
        VStack {
            Text("Total Transaction")
                .font(.title3)
                .foregroundStyle(.secondary)

            Spacer()
                .frame(height: 24)

            HStack(spacing: 4) {
                Text("Rp")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color("PrimaryBlue"))

                TextField("0", text: amountBinding)
                    .keyboardType(.numberPad)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .onChange(of: tvm.amountText) { oldValue, newValue in
                        
                        let clean = newValue.replacingOccurrences(
                            of: "[^0-9]",
                            with: "",
                            options: .regularExpression
                        )
                        
                        tvm.amountValue = Double(clean) ?? 0
                        
                        let formatted = RupiahFormatter.format(clean)
                        
                        if formatted != tvm.amountText {
                            tvm.amountText = formatted
                        }
                    }
            }
        }
        .padding(24)
        .cardStyle()
    }
}
