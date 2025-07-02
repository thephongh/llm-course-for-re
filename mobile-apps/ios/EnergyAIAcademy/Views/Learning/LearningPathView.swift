import SwiftUI

struct LearningPathView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 6) {
                    Text("Lộ Trình Học Tập")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                // Modules List
                VStack(spacing: 16) {
                    ForEach(appState.modules) { module in
                        ModuleCardView(module: module) {
                            // Handle module tap
                            print("Tapped module: \(module.title)")
                        }
                    }
                }
                
                Spacer(minLength: 100) // Space for tab bar
            }
            .padding(.horizontal, 20)
        }
        .background(Color.white)
    }
}