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
            Color.white
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.3)),
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
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black, lineWidth: 2) :
                nil
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}