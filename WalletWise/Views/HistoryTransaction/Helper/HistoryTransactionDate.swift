import Foundation

enum TransactionDateHelper {

    static func sectionTitle(for date: Date) -> String {

        let calendar = Calendar.current

        if calendar.isDateInToday(date) {
            return "Today"
        }

        if calendar.isDateInYesterday(date) {
            return "Yesterday"
        }

        return date.formatted(
            .dateTime
                .day()
                .month()
                .year()
        )
    }
}
