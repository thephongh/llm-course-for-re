import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
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
                    progress: appState.userProgress.totalProgress,
                    size: 100,
                    lineWidth: 8
                )
                
                // Gamification Stats
                GamificationStatsView(userProgress: appState.userProgress)
                
                // Stats Grid
                StatsGridView(userProgress: appState.userProgress)
                
                // Action Buttons
                VStack(spacing: 8) {
                    PrimaryButton(title: "Tiếp Tục Học Tập") {
                        appState.selectedTab = .learning
                    }
                    
                    SecondaryButton(title: "Thực Hành Nhanh") {
                        showingPractice = true
                    }
                }
                
                // Recent Achievements
                RecentAchievementsView(achievements: appState.achievements.filter { $0.isEarned })
                
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

struct GamificationStatsView: View {
    @ObservedObject var userProgress: UserProgress
    
    var body: some View {
        HStack(spacing: 20) {
            StatDisplayView(
                icon: "⭐",
                number: "\(userProgress.points)",
                label: "Điểm"
            )
            
            StatDisplayView(
                icon: "🔥",
                number: "\(userProgress.streak)",
                label: "Ngày liên tiếp"
            )
            
            StatDisplayView(
                icon: "🏆",
                number: userProgress.level,
                label: userProgress.levelTitle
            )
        }
    }
}

struct StatDisplayView: View {
    let icon: String
    let number: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(icon)
                .font(.title2)
            
            Text(number)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(label)
                .font(.caption1)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity)
    }
}

struct StatsGridView: View {
    @ObservedObject var userProgress: UserProgress
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
            StatCardView(
                number: "\(userProgress.completedLessons)",
                label: "Bài học hoàn thành"
            )
            
            StatCardView(
                number: "\(userProgress.studyMinutes)",
                label: "Phút học tập"
            )
            
            StatCardView(
                number: "\(userProgress.practiceCount)",
                label: "Lần thực hành"
            )
            
            StatCardView(
                number: "\(Int(userProgress.averageScore * 100))%",
                label: "Điểm TB"
            )
        }
    }
}

struct StatCardView: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(number)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(label)
                .font(.caption1)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(12)
    }
}

struct RecentAchievementsView: View {
    let achievements: [Achievement]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Thành Tựu Gần Đây")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            VStack(spacing: 8) {
                ForEach(achievements.prefix(2)) { achievement in
                    AchievementRowView(achievement: achievement)
                }
            }
        }
    }
}

struct AchievementRowView: View {
    let achievement: Achievement
    
    var body: some View {
        HStack(spacing: 12) {
            Text(achievement.icon)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.white.opacity(0.2))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(achievement.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(achievement.description)
                    .font(.caption1)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Spacer()
            
            Text("+\(achievement.points) điểm")
                .font(.caption1)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.2))
                .cornerRadius(6)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
}