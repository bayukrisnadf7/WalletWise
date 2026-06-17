import SwiftUI
import SwiftData

public struct TransactionDetailView: View {
    let id: UUID
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var router: AppRouter

    @State private var showDeleteAlert = false
    @Query private var transactions: [TransactionModel]
    
    public var body: some View {
        let transaction = transactions.first(where: { $0.id == id })!
        let category = CategoryModel.categories.first(where: {
            $0.title == transaction.category
        })
        let color = ColorCategoryHelper.color(for: transaction.category)
        
        VStack {
            VStack(spacing: 12) {

                Image(systemName: category?.icon ?? "questionmark.circle")
                    .foregroundStyle(color)
                    .font(.largeTitle)
                    .padding(20)
                    .background(
                        Circle()
                            .fill(color.opacity(0.15))
                    )

                Text(
                    "-\(transaction.amount.formatted(.currency(code: "IDR")))"
                )
                .foregroundStyle(.red)
                .font(.title.bold())

                Text(transaction.category)
            }
            
            Spacer().frame(height: 20)
            
            VStack(alignment: .leading, spacing: 16) {

                Text("Transaction Information")
                    .font(.headline)

                Divider()

                HStack {
                    Text("Category")
                        .foregroundStyle(.secondary)

                    Spacer()

                    Text(transaction.category)
                        .fontWeight(.medium)
                }

                Divider()

                HStack {
                    Text("Amount")
                        .foregroundStyle(.secondary)

                    Spacer()

                    Text(
                        transaction.amount.formatted(
                            .currency(code: "IDR")
                        )
                    )
                    .fontWeight(.medium)
                }

                Divider()

                HStack {
                    Text("Date")
                        .foregroundStyle(.secondary)

                    Spacer()

                    Text(
                        transaction.transactionDate.formatted(
                            .dateTime
                                .day()
                                .month(.wide)
                                .year()
                                .hour()
                                .minute()
                        )
                    )
                    .fontWeight(.medium)
                    .multilineTextAlignment(.trailing)
                }

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Note")
                        .foregroundStyle(.secondary)

                    Text(transaction.note.isEmpty ? "-" : transaction.note)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.08))
                        )
                }

            }
            .padding()
            .cardStyle()
            
            VStack(spacing: 12) {

                Button {
                    router.dashboardPath.append(DashboardRoute.addTransaction.self)
                } label: {

                    HStack {
                        Image(systemName: "square.and.pencil")
                        Text("Edit Transaction")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("PrimaryBlue"))
                    )
                }

                Button {
                    showDeleteAlert = true
                } label: {

                    HStack {
                        Image(systemName: "trash")
                        Text("Delete Transaction")
                    }
                    .font(.headline)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.red.opacity(0.08))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.red.opacity(0.3), lineWidth: 1)
                    )
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("Detail Transaction")
        .toolbar(.hidden, for: .tabBar)
        .alert(
            "Delete Transaction",
            isPresented: $showDeleteAlert
        ) {

            Button("Cancel", role: .cancel) { }

            Button("Delete", role: .destructive) {

                context.delete(transaction)

                do {
                    try context.save()
                    dismiss()
                } catch {
                    print(error)
                }
            }

        } message: {
            Text("This transaction will be permanently deleted.")
        }
    }
}
