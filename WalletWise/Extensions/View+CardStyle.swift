import SwiftUI

extension View {
    func cardStyle() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        Color.primary.opacity(0.08),
                        lineWidth: 1
                    )
            )
            .shadow(
                color: .black.opacity(0.08),
                radius: 12,
                y: 4
            )
    }
}
