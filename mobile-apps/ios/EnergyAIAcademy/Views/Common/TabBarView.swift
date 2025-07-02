import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Tab
    
    enum Tab: String, CaseIterable {
        case home = "🏠"
        case learning = "📚"
        case practice = "🎯"
        case progress = "📊"
        case profile = "⚙️"
        
        var title: String {
            switch self {
            case .home: return "Trang Chủ"
            case .learning: return "Học Tập"
            case .practice: return "Thực Hành"
            case .progress: return "Tiến Độ"
            case .profile: return "Hồ Sơ"
            }
        }
    }
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabItemView(
                    tab: tab,
                    isSelected: selectedTab == tab
                ) {
                    selectedTab = tab
                }
            }
        }
        .padding(.horizontal, 4)
        .padding(.top, 8)
        .padding(.bottom, 34) // Safe area
        .background(
            ZStack {
                // Glass material background
                Rectangle()
                    .fill(Material.regularMaterial)
                
                // Additional glass overlay
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                
                // Glass reflection at top
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.3),
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .center
                        )
                    )
                    .frame(height: 30)
                    .offset(y: -15)
            }
            .overlay(
                Rectangle()
                    .frame(height: 0.5)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.6),
                                Color.white.opacity(0.2)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    ),
                alignment: .top
            )
        )
    }
}

struct TabItemView: View {
    let tab: TabBarView.Tab
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Text(tab.rawValue)
                    .font(.title3)
                    .foregroundColor(isSelected ? .black : .gray)
                
                Text(tab.title)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .black : .gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(
                isSelected ? 
                ZStack {
                    // Glass background for selected tab
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Material.ultraThinMaterial)
                        .opacity(0.7)
                    
                    // Glass reflection
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.4),
                                    Color.clear
                                ],
                                startPoint: .top,
                                endPoint: .center
                            )
                        )
                    
                    // Glass border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.6),
                                    Color.white.opacity(0.2)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                } : nil
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}