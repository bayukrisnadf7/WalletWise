import Foundation

enum TransactionFilter {

    static func filter(
        transactions: [TransactionModel],
        searchText: String,
        selectedCategory: CategoryModel?
    ) -> [TransactionModel] {

        transactions.filter { transaction in

            let matchesSearch =
                searchText.isEmpty ||
                transaction.note.localizedCaseInsensitiveContains(searchText) ||
                transaction.category.localizedCaseInsensitiveContains(searchText)

            let matchesCategory =
                selectedCategory == nil ||
                transaction.category == selectedCategory?.title

            return matchesSearch && matchesCategory
        }
    }

    static func groupByDate(
        transactions: [TransactionModel]
    ) -> [TransactionSection] {

        let grouped = Dictionary(
            grouping: transactions,
            by: {
                Calendar.current.startOfDay(
                    for: $0.transactionDate
                )
            }
        )

        return grouped
            .map {
                TransactionSection(
                    date: $0.key,
                    transactions: $0.value
                )
            }
            .sorted { $0.date > $1.date }
    }
}
