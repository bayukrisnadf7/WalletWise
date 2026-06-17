import Foundation

struct EducationModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let image: String?
    let date: String
    
    static let educations: [EducationModel] = [
        .init(title: "Mengenal Dana Darurat", description: "Lorem Ipsum", image: "education1", date: "12/04/2026"),
        .init(title: "Mengenal Dana Darurat", description: "Lorem Ipsum", image: "education1", date: "10/04/2026"),
        .init(title: "Mengenal Dana Darurat", description: "Lorem Ipsum", image: "education1", date: "8/04/2026"),
    ]
    
    static let sliderEducation: [EducationModel] = [
        .init(title: "Mengenal Dana Darurat", description: "Lorem Ipsum", image: "content1", date: "12/04/2026"),
        .init(title: "Mengenal Dana Darurat", description: "Lorem Ipsum", image: "content2", date: "10/04/2026"),
        .init(title: "Mengenal Dana Darurat", description: "Lorem Ipsum", image: "content3", date: "8/04/2026"),
    ]
}
