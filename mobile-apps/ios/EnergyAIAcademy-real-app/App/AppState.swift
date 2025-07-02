import SwiftUI

class AppState: ObservableObject {
    @Published var selectedTab: TabBarView.Tab = .home
    @Published var userProgress = UserProgress()
    @Published var modules: [Module] = []
    @Published var achievements: [Achievement] = []
    
    init() {
        loadInitialData()
    }
    
    private func loadInitialData() {
        // Load sample data
        modules = sampleModules
        achievements = sampleAchievements
    }
}