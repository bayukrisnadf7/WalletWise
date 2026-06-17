import SwiftUI


struct EducationNavigation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: EducationRoute.self) { route in
                switch route {
                    
                case .articleDetail(id: let id):
                    DetailEducationView(id: id)
                }
                
            }
    }
}


extension View {
    func educationNavigation() -> some View {
        modifier(EducationNavigation())
    }
}
