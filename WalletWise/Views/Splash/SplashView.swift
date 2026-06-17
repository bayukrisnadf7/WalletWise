import SwiftUI

public struct SplashView: View {
    @State private var progress: Double = 0
    @State private var isFinishedShow = false
    
    public var body: some View {
        
        if isFinishedShow {
            MainTabView()
        } else {
            VStack (alignment: .center, spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                
                VStack {
                    Text("Wallet Wise")
                        .foregroundStyle(Color("PrimaryBlue"))
                        .font(Font.title.bold())
                    
                    Text("Precision Finance")
                        .foregroundStyle(Color.gray)
                        .font(Font.subheadline.bold())
                    
                }
                
                Spacer()
                    .frame(height: 100)
                ProgressView(value: progress)
                    .frame(width: 220)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                            progress += 0.01
                            
                            if progress >= 1 {
                                progress = 0
                            }
                        }
                    }
                    .tint(Color("PrimaryBlue"))
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onAppear {
                startSplash()
            }
        }
    }
    
    private func startSplash() {
        let duration = 3.0
        let interval = 0.03
        
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            
            progress += interval / duration
            
            if progress >= 1 {
                progress = 1
                timer.invalidate()
                
                isFinishedShow = true
            }
        }
    }
}

#Preview {
    SplashView()
}
