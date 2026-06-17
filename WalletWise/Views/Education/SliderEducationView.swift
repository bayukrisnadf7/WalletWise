import SwiftUI

struct SliderEducationView: View {
    @EnvironmentObject var router: AppRouter
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 6) {
                    
                    ForEach(EducationModel.sliderEducation, id: \.self) { education in
                        Button {
                            router.educationPath.append(EducationRoute.articleDetail(id: education.id))
                        } label: {
                            ZStack(alignment: .bottomLeading) {
                                Image(education.image ?? "placeholder")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(
                                        width: geo.size.width,
                                        height: 220
                                    )
                                    .clipped()
                                
                                VStack (alignment: .leading) {
                                    Text(education.title)
                                        .font(.title3.bold())

                                    Text(education.date)
                                        .font(Font.subheadline)
                                }
                                .padding()
                                .foregroundStyle(.white)
                                
                            }
                            .frame(
                                width: geo.size.width,
                                height: 220
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 16)
                            )
                        }
                        
                    }
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 220)
    }
}
