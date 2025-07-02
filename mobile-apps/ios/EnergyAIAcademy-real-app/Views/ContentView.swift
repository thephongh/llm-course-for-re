import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                StatusBarView()
                
                // Main content area
                Group {
                    switch appState.selectedTab {
                    case .home:
                        HomeView()
                    case .learning:
                        LearningPathView()
                    case .practice:
                        PracticeLabView()
                    case .progress:
                        ProgressView()
                    case .profile:
                        ProfileView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer(minLength: 100) // Space for tab bar
            }
            
            VStack {
                Spacer()
                FloatingActionButton {
                    appState.selectedTab = .practice
                }
                .padding(.bottom, 100)
                
                TabBarView(selectedTab: $appState.selectedTab)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}