import SwiftUI

// MARK: - Tab Bar
struct TabBarView: View {
    @Binding var selectedTab: Tab
    
    enum Tab: CaseIterable {
        case home, learning, practice, progress, profile
        
        var title: String {
            switch self {
            case .home: return "Trang Chủ"
            case .learning: return "Học"
            case .practice: return "Thực Hành"
            case .progress: return "Tiến Độ"
            case .profile: return "Hồ Sơ"
            }
        }
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .learning: return "book"
            case .practice: return "flask"
            case .progress: return "chart.bar"
            case .profile: return "person"
            }
        }
    }
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabBarItem(
                    tab: tab,
                    isSelected: selectedTab == tab
                ) {
                    selectedTab = tab
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 25)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray300.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 8)
        .padding(.horizontal, 20)
        .padding(.bottom, 34)
    }
}

struct TabBarItem: View {
    let tab: TabBarView.Tab
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: tab.icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(isSelected ? .primaryBrand : .textMuted)
                
                Text(tab.title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(isSelected ? .primaryBrand : .textMuted)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Liquid Glass Status Bar
struct StatusBarView: View {
    var body: some View {
        HStack {
            Text("EnergyAI Academy")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(LinearGradient.primaryBrand)
            
            Spacer()
            
            HStack(spacing: 8) {
                Image(systemName: "flame.fill")
                    .foregroundColor(.errorRed)
                    .font(.system(size: 16, weight: .medium))
                Text("7")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.textPrimary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(.ultraThinMaterial)
                    .overlay(
                        Capsule()
                            .stroke(Color.errorRed.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            .ultraThinMaterial,
            in: Rectangle()
        )
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray300.opacity(0.3)),
            alignment: .bottom
        )
    }
}

// MARK: - Floating Action Button
struct FloatingActionButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(Color.accentOrange)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Progress Circle
struct ProgressCircleView: View {
    let progress: Double
    let size: CGFloat
    let lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(LinearGradient.primaryBrand, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack {
                Text("\(Int(progress * 100))%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primaryBrand)
                Text("Hoàn thành")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Primary Button
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(LinearGradient.primaryBrand)
                .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Module Card
struct ModuleCardView: View {
    let module: Module
    @State private var showingModuleDetail = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(module.icon)
                    .font(.title)
                
                VStack(alignment: .leading) {
                    Text(module.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    Text("\(Int(module.duration / 60)) phút")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            
            if module.status != .locked {
                SwiftUI.ProgressView(value: module.progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.primaryBrand))
                    .frame(height: 6)
            }
            
            HStack {
                Text(statusText)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(statusColor)
                
                Spacer()
                
                if module.status != .locked {
                    Text("\(Int(module.progress * 100))%")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primaryBrand)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        .opacity(module.status == .locked ? 0.6 : 1.0)
        .onTapGesture {
            if module.status != .locked {
                showingModuleDetail = true
            }
        }
        .sheet(isPresented: $showingModuleDetail) {
            ModuleDetailView(module: module)
        }
    }
    
    private var statusText: String {
        switch module.status {
        case .completed: return "Đã hoàn thành"
        case .current: return "Đang học"
        case .locked: return module.unlockRequirement ?? "Chưa mở khóa"
        }
    }
    
    private var statusColor: Color {
        switch module.status {
        case .completed: return .successGreen
        case .current: return .primaryBrand
        case .locked: return .gray
        }
    }
}