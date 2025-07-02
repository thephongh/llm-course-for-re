# SwiftUI Conversion Guide for EnergyAI Academy App

## Project Structure

### 1. App Architecture
```
EnergyAIAcademy/
├── App/
│   ├── EnergyAIAcademyApp.swift
│   └── AppState.swift
├── Views/
│   ├── ContentView.swift
│   ├── Home/
│   │   ├── HomeView.swift
│   │   ├── ProgressCircleView.swift
│   │   ├── GamificationStatsView.swift
│   │   └── AchievementRowView.swift
│   ├── Learning/
│   │   ├── LearningPathView.swift
│   │   ├── ModuleCardView.swift
│   │   └── MicrolessonView.swift
│   ├── Practice/
│   │   ├── PracticeLabView.swift
│   │   ├── TemplateCardView.swift
│   │   └── PromptBuilderView.swift
│   ├── Progress/
│   │   ├── ProgressView.swift
│   │   ├── LeaderboardView.swift
│   │   └── AchievementGalleryView.swift
│   ├── Profile/
│   │   └── ProfileView.swift
│   └── Common/
│       ├── TabBarView.swift
│       ├── FloatingActionButton.swift
│       └── StatusBarView.swift
├── Models/
│   ├── Module.swift
│   ├── Microlesson.swift
│   ├── Achievement.swift
│   ├── UserProgress.swift
│   └── LeaderboardEntry.swift
├── ViewModels/
│   ├── HomeViewModel.swift
│   ├── LearningViewModel.swift
│   ├── PracticeViewModel.swift
│   └── ProgressViewModel.swift
├── Components/
│   ├── Buttons/
│   ├── Cards/
│   ├── Progress/
│   └── Navigation/
└── Resources/
    ├── Colors.swift
    ├── Fonts.swift
    └── Assets.xcassets
```

## Core Design Rules

### 2. Color System
```swift
// Colors.swift
extension Color {
    // Gradient Colors
    static let gradientPurple = Color(red: 0.42, green: 0.27, blue: 0.76)
    static let gradientBlue = Color(red: 0.02, green: 0.71, blue: 0.84)
    static let gradientPink = Color(red: 0.93, green: 0.28, blue: 0.60)
    static let gradientOrange = Color(red: 0.97, green: 0.44, blue: 0.09)
    
    // App Colors
    static let primaryBlue = Color(red: 0.00, green: 0.48, blue: 1.00)
    static let successGreen = Color(red: 0.20, green: 0.78, blue: 0.35)
    static let warningOrange = Color(red: 1.00, green: 0.23, blue: 0.19)
    
    // Background Colors
    static let homeGradient = LinearGradient(
        colors: [.gradientPurple, .gradientBlue, .gradientPink, .gradientOrange],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let practiceGradient = LinearGradient(
        colors: [Color(red: 0.54, green: 0.35, blue: 0.17), Color(red: 0.85, green: 0.46, blue: 0.02)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

### 3. Typography System
```swift
// Fonts.swift
extension Font {
    static let largeTitle = Font.system(size: 34, weight: .bold, design: .default)
    static let title1 = Font.system(size: 28, weight: .bold, design: .default)
    static let title2 = Font.system(size: 22, weight: .bold, design: .default)
    static let title3 = Font.system(size: 20, weight: .semibold, design: .default)
    static let headline = Font.system(size: 17, weight: .semibold, design: .default)
    static let body = Font.system(size: 17, weight: .regular, design: .default)
    static let callout = Font.system(size: 16, weight: .regular, design: .default)
    static let subheadline = Font.system(size: 15, weight: .regular, design: .default)
    static let footnote = Font.system(size: 13, weight: .regular, design: .default)
    static let caption1 = Font.system(size: 12, weight: .regular, design: .default)
    static let caption2 = Font.system(size: 11, weight: .regular, design: .default)
}
```

## Data Models

### 4. Core Models
```swift
// Module.swift
struct Module: Identifiable, Codable {
    let id: Int
    let title: String
    let duration: TimeInterval
    let microlessons: [Microlesson]
    let status: ModuleStatus
    let progress: Double
    let icon: String
    let unlockRequirement: String?
}

enum ModuleStatus: String, CaseIterable, Codable {
    case completed = "completed"
    case current = "current"
    case locked = "locked"
}

// Microlesson.swift
struct Microlesson: Identifiable, Codable {
    let id: String
    let title: String
    let duration: TimeInterval
    let points: Int
    let status: MicrolessonStatus
}

enum MicrolessonStatus: String, CaseIterable, Codable {
    case completed = "completed"
    case current = "current"
    case locked = "locked"
}

// UserProgress.swift
class UserProgress: ObservableObject {
    @Published var totalProgress: Double = 0.2
    @Published var points: Int = 1250
    @Published var streak: Int = 7
    @Published var level: String = "Cấp 2"
    @Published var levelTitle: String = "Học viên AI"
    @Published var completedLessons: Int = 8
    @Published var studyMinutes: Int = 56
    @Published var practiceCount: Int = 12
    @Published var averageScore: Double = 0.92
    @Published var currentModule: Int = 2
    @Published var currentMicrolesson: String = "2.3"
}

// Achievement.swift
struct Achievement: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let points: Int
    let isEarned: Bool
    let earnedDate: Date?
}
```

## View Components

### 5. Custom Views and Components

#### Primary Button Component
```swift
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.black)
                .cornerRadius(8)
        }
        .buttonStyle(PressedButtonStyle())
    }
}

struct PressedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
```

#### Progress Circle Component
```swift
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
                .stroke(
                    Color.primaryBlue,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 2) {
                Text("\(Int(progress * 100))%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primaryBlue)
                
                Text("Hoàn thành")
                    .font(.caption1)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: size, height: size)
    }
}
```

#### Module Card Component
```swift
struct ModuleCardView: View {
    let module: Module
    let onTap: () -> Void
    @State private var showMicrolessons = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                Text(module.icon)
                    .font(.title2)
                    .frame(width: 40, height: 40)
                    .background(backgroundForStatus)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(module.title)
                        .font(.headline)
                        .foregroundColor(textColorForStatus)
                        .lineLimit(2)
                    
                    Text("\(module.microlessons.count) bài học • \(Int(module.duration)) phút")
                        .font(.caption1)
                        .foregroundColor(textColorForStatus.opacity(0.8))
                    
                    ProgressView(value: module.progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .primaryBlue))
                        .frame(height: 4)
                }
                
                Spacer()
                
                if module.status == .current {
                    Button("Tiếp tục") {
                        onTap()
                    }
                    .font(.caption1)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.primaryBlue)
                    .cornerRadius(8)
                }
            }
            
            if showMicrolessons {
                VStack(spacing: 8) {
                    ForEach(module.microlessons) { microlesson in
                        MicrolessonRowView(microlesson: microlesson)
                    }
                }
                .padding(.top, 8)
                .transition(.opacity.combined(with: .slide))
            }
            
            if module.status == .locked {
                Text(module.unlockRequirement ?? "")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding(16)
        .background(cardBackgroundForStatus)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColorForStatus, lineWidth: 1)
        )
        .onTapGesture {
            if module.status != .locked {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showMicrolessons.toggle()
                }
            }
        }
        .disabled(module.status == .locked)
    }
    
    private var backgroundForStatus: Color {
        switch module.status {
        case .completed: return Color.successGreen.opacity(0.1)
        case .current: return Color.white.opacity(0.1)
        case .locked: return Color.gray.opacity(0.1)
        }
    }
    
    private var cardBackgroundForStatus: some View {
        Group {
            switch module.status {
            case .completed:
                Color.white
            case .current:
                Color.homeGradient
            case .locked:
                Color.white
            }
        }
    }
    
    private var borderColorForStatus: Color {
        switch module.status {
        case .completed: return Color.successGreen
        case .current: return Color.clear
        case .locked: return Color.gray.opacity(0.3)
        }
    }
    
    private var textColorForStatus: Color {
        switch module.status {
        case .completed, .locked: return Color.black
        case .current: return Color.white
        }
    }
}
```

### 6. Screen Views

#### Home View
```swift
struct HomeView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var showingPractice = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 6) {
                    Text("Học Viện EnergyAI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Làm Chủ Công Cụ AI Cho Chuyên Gia Năng Lượng")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                // Progress Circle
                ProgressCircleView(
                    progress: userProgress.totalProgress,
                    size: 100,
                    lineWidth: 8
                )
                
                // Gamification Stats
                GamificationStatsView(userProgress: userProgress)
                
                // Stats Grid
                StatsGridView(userProgress: userProgress)
                
                // Action Buttons
                VStack(spacing: 8) {
                    PrimaryButton(title: "Tiếp Tục Học Tập") {
                        // Navigate to learning
                    }
                    
                    SecondaryButton(title: "Thực Hành Nhanh") {
                        showingPractice = true
                    }
                }
                
                // Recent Achievements
                RecentAchievementsView()
                
                Spacer(minLength: 100) // Space for FAB
            }
            .padding(.horizontal, 20)
        }
        .background(Color.homeGradient)
        .sheet(isPresented: $showingPractice) {
            PracticeLabView()
        }
    }
}
```

#### Tab Bar View
```swift
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
```

## Key Implementation Rules

### 7. Navigation Rules
- Use `@StateObject` for view models in parent views
- Use `@ObservedObject` for passed-down view models
- Implement tab-based navigation with custom TabBarView
- Use sheets for modal presentations (Practice Lab, Profile settings)
- Navigate within learning modules using NavigationView/NavigationStack

### 8. State Management Rules
- Keep app-wide state in `AppState` class
- Use `@Published` properties for UI-reactive data
- Implement `ObservableObject` protocol for all view models
- Use `@State` for local view state only
- Persist user progress using UserDefaults or Core Data

### 9. Animation Rules
- Use `.animation(.easeInOut(duration: 0.3))` for standard transitions
- Implement custom `ButtonStyle` for press animations
- Use `.transition()` modifiers for view appearances
- Animate progress changes with spring animations
- Use `withAnimation {}` blocks for state-driven animations

### 10. Performance Rules
- Use `LazyVStack`/`LazyHStack` for long scrolling lists
- Implement view recycling for microlesson lists
- Cache images and icons in memory
- Use `@ViewBuilder` for conditional view rendering
- Minimize re-renders with proper state management

### 11. Accessibility Rules
- Add `.accessibilityLabel()` to all interactive elements
- Use `.accessibilityHint()` for complex interactions
- Ensure minimum 44pt touch targets
- Support Dynamic Type for text scaling
- Implement VoiceOver support for progress indicators

### 12. Error Handling Rules
- Implement graceful fallbacks for missing data
- Show loading states during data fetching
- Use alert dialogs for user-facing errors
- Log errors for debugging without exposing to users
- Validate user input in practice lab

## Testing Strategy

### 13. Unit Testing
- Test view models independently
- Mock data services for consistent testing
- Test state transitions and business logic
- Validate progress calculations
- Test achievement unlocking logic

### 14. UI Testing
- Test navigation between tabs
- Verify module unlocking behavior
- Test practice lab interactions
- Validate progress updates
- Test accessibility features

## Deployment Considerations

### 15. iOS Compatibility
- Target iOS 15.0+ for SwiftUI features
- Test on iPhone SE to iPhone Pro Max
- Support both portrait and landscape orientations
- Implement proper safe area handling
- Test on different iOS versions

### 16. Performance Optimization
- Optimize image sizes and formats
- Implement lazy loading for course content
- Cache frequently accessed data
- Monitor memory usage during navigation
- Profile app performance regularly

This guide provides a comprehensive foundation for converting your HTML prototype into a native SwiftUI app while maintaining the design integrity and user experience.