import SwiftUI

extension View {
    func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardModifier())
    }
}
