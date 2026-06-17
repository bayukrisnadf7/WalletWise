import SwiftUI


public struct EducationView: View {
    @EnvironmentObject var router: AppRouter
    
    public var body: some View {
        VStack (spacing: 16) {
            VStack (alignment: .leading, spacing: 6) {
                Text ("Finance Education")
                    .font(Font.title.bold())
                    .foregroundStyle(Color.primaryBlue)
                
                Text ("Improve your financial literacy")
                    .font(Font.title3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            SliderEducationView()
            
            Spacer().frame(height: 6)
            
            Text ("Latest news for You")
                .padding(.horizontal)
                .font(Font.title3.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            ScrollView (.vertical, showsIndicators: true) {
                VStack (spacing: 16) {
                    ForEach (EducationModel.educations, id: \.self) { education in
                        Button {
                            router.educationPath.append(EducationRoute.articleDetail(id: education.id))
                        } label: {
                            VStack (alignment: .leading, spacing: 0) {
                                Image (education.image ?? "placeholder")
                                    .resizable()
                                    .frame(maxWidth: .infinity, minHeight: 220)
                                    .clipShape(
                                        UnevenRoundedRectangle(
                                            topLeadingRadius: 16,
                                            bottomLeadingRadius: 0,
                                            bottomTrailingRadius: 0,
                                            topTrailingRadius: 16
                                        )
                                    )
                                HStack {
                                    VStack (alignment: .leading, spacing: 6) {
                                        Text(education.title)
                                            .font(.headline)
                                            .bold()
                                        
                                        Text(education.date)
                                            .font(Font.subheadline)
                                    }
                                                                        
                                    Spacer()
                                    
                                    Image (systemName: "chevron.right")
                                        .foregroundStyle(Color.primary)
                                }
                                .padding()
                                .frame(minHeight: 60)
                                .background(
                                    UnevenRoundedRectangle(
                                        topLeadingRadius: 0,
                                        bottomLeadingRadius: 20,
                                        bottomTrailingRadius: 20,
                                        topTrailingRadius: 0
                                    )
                                    .fill(Color(.systemBackground))
                                )
                                .overlay(
                                    UnevenRoundedRectangle(
                                        topLeadingRadius: 0,
                                        bottomLeadingRadius: 20,
                                        bottomTrailingRadius: 20,
                                        topTrailingRadius: 0
                                    )
                                    .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                                )
                                .shadow(
                                    color: .black.opacity(0.08),
                                    radius: 12,
                                    y: 4
                                )
                            }
                        }
                        .font(Font.subheadline.bold())
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 100)
            }
            .ignoresSafeArea(.container, edges: .bottom)
            
        }
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(
            .gray.opacity(0.1)
        )
    }
}
