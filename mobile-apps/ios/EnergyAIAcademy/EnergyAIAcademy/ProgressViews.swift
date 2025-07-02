import SwiftUI

// MARK: - Progress View
struct UserProgressView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 6) {
                    Text("Tiến Độ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                // Overall Progress
                VStack(alignment: .leading, spacing: 12) {
                    Text("Tiến Độ Tổng Thể")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    HStack {
                        ProgressCircleView(
                            progress: appState.userProgress.totalProgress,
                            size: 120,
                            lineWidth: 10
                        )
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                // Module Progress
                VStack(alignment: .leading, spacing: 12) {
                    Text("Tiến Độ Mô-đun")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    VStack(spacing: 12) {
                        ForEach(appState.modules.prefix(2)) { module in
                            ModuleProgressItemView(module: module)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                // Achievements Gallery
                VStack(alignment: .leading, spacing: 12) {
                    Text("Thành Tựu")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
                        ForEach(appState.achievements) { achievement in
                            AchievementBadgeView(achievement: achievement)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                // Weekly Leaderboard
                VStack(alignment: .leading, spacing: 12) {
                    Text("Bảng Xếp Hạng Tuần")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    VStack(spacing: 8) {
                        ForEach(sampleLeaderboard) { entry in
                            LeaderboardItemView(entry: entry)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.gray.opacity(0.1))
    }
}

struct ModuleProgressItemView: View {
    let module: Module
    
    var body: some View {
        HStack {
            Text(module.title.components(separatedBy: ":").last?.trimmingCharacters(in: .whitespaces) ?? module.title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .lineLimit(1)
            
            Spacer()
            
            SwiftUI.ProgressView(value: module.progress)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.primaryBrand))
                .frame(width: 80, height: 4)
            
            Text("\(Int(module.progress * 100))%")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primaryBrand)
                .frame(width: 40, alignment: .trailing)
        }
        .padding(.vertical, 4)
    }
}

struct AchievementBadgeView: View {
    let achievement: Achievement
    
    var body: some View {
        VStack(spacing: 4) {
            Text(achievement.icon)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(achievement.isEarned ? Color.successGreen.opacity(0.2) : Color.gray.opacity(0.2))
                .cornerRadius(25)
                .overlay(
                    Circle()
                        .stroke(achievement.isEarned ? Color.successGreen : Color.gray, lineWidth: 2)
                )
            
            Text(achievement.title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(achievement.isEarned ? .black : .gray)
                .lineLimit(2)
        }
        .opacity(achievement.isEarned ? 1.0 : 0.5)
    }
}

struct LeaderboardItemView: View {
    let entry: LeaderboardEntry
    
    var body: some View {
        HStack(spacing: 12) {
            // Rank
            Text("\(entry.rank)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(entry.rank == 1 ? .yellow : .black)
                .frame(width: 30)
            
            // User Info
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.username)
                    .font(.subheadline)
                    .fontWeight(entry.isCurrentUser ? .bold : .medium)
                    .foregroundColor(.black)
                
                Text("\(entry.points) điểm")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Position Change
            Group {
                switch entry.positionChange {
                case .winner:
                    Text("🏆")
                case .up:
                    Text("+1")
                        .foregroundColor(.green)
                case .down:
                    Text("-1")
                        .foregroundColor(.red)
                case .same:
                    Text("-")
                        .foregroundColor(.gray)
                }
            }
            .font(.caption)
            .fontWeight(.semibold)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(entry.isCurrentUser ? Color.primaryBrand.opacity(0.1) : Color.clear)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(entry.isCurrentUser ? Color.primaryBrand : Color.clear, lineWidth: 1)
        )
    }
}