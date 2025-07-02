import SwiftUI

// MARK: - Helper Components
struct StatsItem: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.textSecondary)
            Text(value)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(color)
        }
    }
}

struct CourseStatsRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primaryBrand)
                .frame(width: 20)
            
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.textSecondary)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.textPrimary)
        }
    }
}

// MARK: - Home View with Liquid Glass Design
struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Hero Section
                HeroSection(
                    title: "Học AI Cho Chuyên Gia Năng Lượng",
                    subtitle: "Làm chủ Large Language Models và Generative AI với khóa học tương tác 4 tiếng"
                )
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Progress Overview
                GlassCard {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Tiến Độ Của Bạn")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.textPrimary)
                        
                        HStack(spacing: 24) {
                            LiquidProgressCircle(
                                progress: appState.userProgress.totalProgress,
                                size: 100,
                                lineWidth: 8
                            )
                            
                            VStack(alignment: .leading, spacing: 12) {
                                StatsItem(
                                    title: "Mô-đun hoàn thành",
                                    value: "\(appState.userProgress.completedModules)/\(appState.userProgress.totalModules)",
                                    color: .primaryBrand
                                )
                                
                                StatsItem(
                                    title: "Tổng điểm",
                                    value: "\(appState.userProgress.totalPoints)",
                                    color: .accentOrange
                                )
                                
                                StatsItem(
                                    title: "Chuỗi ngày",
                                    value: "\(appState.userProgress.streakDays) ngày",
                                    color: .errorRed
                                )
                            }
                            
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                // Current Module
                if let currentModule = appState.modules.first(where: { $0.status == .current }) {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Tiếp Tục Học Tập")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.textPrimary)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        LiquidModuleCard(module: currentModule)
                            .padding(.horizontal, 20)
                        
                        Button(action: { appState.selectedTab = .learning }) {
                            HStack {
                                Image(systemName: "play.fill")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("Tiếp tục học")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(LinearGradient.primaryBrand)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                
                // Course Overview
                GlassCard {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Khóa Học Tổng Quan")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.textPrimary)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            CourseStatsRow(icon: "clock", title: "Thời lượng", value: "4 giờ")
                            CourseStatsRow(icon: "book", title: "Modules", value: "5 modules tương tác")
                            CourseStatsRow(icon: "questionmark.circle", title: "Quiz", value: "20 câu hỏi")
                            CourseStatsRow(icon: "arrow.up.right", title: "Định dạng", value: "Học từng bước")
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 100)
            }
        }
        .background(Color.backgroundLight)
    }
}

// MARK: - Learning Path View
struct LearningPathView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    Text("Lộ Trình Học Tập")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(LinearGradient.primaryBrand)
                    
                    Text("Học từng bước với 5 modules tương tác được thiết kế cho chuyên gia năng lượng")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.textSecondary)
                        .lineLimit(nil)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Modules
                VStack(spacing: 16) {
                    ForEach(appState.modules) { module in
                        LiquidModuleCard(module: module)
                            .padding(.horizontal, 20)
                    }
                }
                
                Spacer(minLength: 100)
            }
        }
        .background(Color.backgroundLight)
    }
}

// MARK: - Practice Lab View
struct PracticeLabView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    Text("Phòng Thực Hành AI")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(LinearGradient.primaryBrand)
                    
                    Text("Thực hành các kỹ năng AI với bài tập tương tác và scenarios thực tế từ ngành năng lượng")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.textSecondary)
                        .lineLimit(nil)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Coming Soon Card
                GradientCard {
                    VStack(spacing: 20) {
                        Image(systemName: "flask")
                            .font(.system(size: 60))
                            .foregroundColor(.accentOrange)
                        
                        VStack(spacing: 8) {
                            Text("Sắp Ra Mắt!")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.textPrimary)
                            
                            Text("Phòng thực hành tương tác với:")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.textSecondary)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            FeatureRow(icon: "cpu", text: "Prompt Builder tương tác")
                            FeatureRow(icon: "chart.line.uptrend.xyaxis", text: "Case studies năng lượng")
                            FeatureRow(icon: "person.2", text: "Scenarios với stakeholder")
                            FeatureRow(icon: "checkmark.shield", text: "Bài tập đạo đức AI")
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 100)
            }
        }
        .background(Color.backgroundLight)
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primaryBrand)
                .frame(width: 20)
            
            Text(text)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.textPrimary)
            
            Spacer()
        }
    }
}

// MARK: - Profile View
struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    Text("Hồ Sơ Học Viên")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(LinearGradient.primaryBrand)
                    
                    Text("Theo dõi tiến độ và thành tựu của bạn")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                // Profile Info
                GlassCard {
                    VStack(spacing: 20) {
                        // Avatar and name
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(LinearGradient.primaryBrand)
                                    .frame(width: 80, height: 80)
                                
                                Text("PH")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            
                            VStack(spacing: 4) {
                                Text("Phong Han")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.textPrimary)
                                
                                Text("Chuyên gia năng lượng")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.textSecondary)
                            }
                        }
                        
                        // Stats Grid
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                            StatCard(
                                title: "Điểm số",
                                value: "\(appState.userProgress.totalPoints)",
                                icon: "star.fill",
                                color: .accentOrange
                            )
                            StatCard(
                                title: "Chuỗi ngày",
                                value: "\(appState.userProgress.streakDays)",
                                icon: "flame.fill",
                                color: .errorRed
                            )
                            StatCard(
                                title: "Modules",
                                value: "\(appState.userProgress.completedModules)/\(appState.userProgress.totalModules)",
                                icon: "book.fill",
                                color: .primaryBrand
                            )
                            StatCard(
                                title: "Thành tựu",
                                value: "\(appState.achievements.filter { $0.isEarned }.count)",
                                icon: "trophy.fill",
                                color: .successGreen
                            )
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 100)
            }
        }
        .background(Color.backgroundLight)
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.textPrimary)
            
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.textSecondary)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color.opacity(0.2), lineWidth: 1)
                )
        )
    }
}