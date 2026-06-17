import SwiftUI

struct DetailEducationView: View {
    
    let id: UUID
    
    private var education: EducationModel? {
        (EducationModel.educations + EducationModel.sliderEducation)
            .first { $0.id == id }
    }
    
    var body: some View {
        
        if let education {
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    Image(education.image ?? "placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 320)
                        .frame(maxWidth: 400)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text(education.title)
                            .font(.title.bold())
                        
                        Text(education.date)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Divider()
                        
                        Text(education.description)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemBackground))
                }
            }
            .ignoresSafeArea(edges: .top)
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            
            ContentUnavailableView(
                "Article Not Found",
                systemImage: "newspaper"
            )
        }
    }
}
