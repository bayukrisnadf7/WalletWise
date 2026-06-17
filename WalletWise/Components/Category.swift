import SwiftUI

struct Category: View {
    let title: String
    let icon: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 8) {

            Image(systemName: icon)
                .font(.title3)

            Text(title)
                .font(.caption)
        }
        .frame(width: 50, height: 50)
        .foregroundStyle(
            isSelected ? .white : .primary
        )
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    isSelected
                    ? Color.primaryBlue
                    : Color.gray.opacity(0.1)
                )
        )
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
