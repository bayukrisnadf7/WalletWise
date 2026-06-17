import SwiftUI
import SwiftData

public struct TransactionView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var route: AppRouter
    @State private var tvm = TransactionViewModel()
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                HeroTransactionView(tvm: tvm)

                AnotherInputTransactionView(tvm: tvm)

                Button {
                    do {
                        try tvm.saveTransaction(context: context)
                        tvm.resetForm()
                        route.dashboardPath.removeLast()
                    } catch {
                        print(error)
                    }
                } label: {
                    Text("Save Transaction")
                        .foregroundStyle(.white)
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("PrimaryBlue"))
                        )
                }

            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
        .navigationTitle("Add Transaction")
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

