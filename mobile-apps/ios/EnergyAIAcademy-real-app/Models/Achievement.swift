import Foundation

struct Achievement: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let points: Int
    let isEarned: Bool
    let earnedDate: Date?
}

let sampleAchievements: [Achievement] = [
    Achievement(
        id: "level_2",
        title: "Học Viên AI Cấp 2",
        description: "Hoàn thành 8 bài học",
        icon: "🏆",
        points: 100,
        isEarned: true,
        earnedDate: Date()
    ),
    Achievement(
        id: "streak_7",
        title: "Streaker",
        description: "7 ngày học liên tiếp",
        icon: "🔥",
        points: 50,
        isEarned: true,
        earnedDate: Date()
    ),
    Achievement(
        id: "completed_lessons",
        title: "Hoàn thành 8 bài học",
        description: "Hoàn thành 8 bài học",
        icon: "📚",
        points: 80,
        isEarned: true,
        earnedDate: Date()
    ),
    Achievement(
        id: "practice_master",
        title: "Sử dụng Phòng Thực Hành 20 lần",
        description: "Sử dụng Phòng Thực Hành 20 lần",
        icon: "🎯",
        points: 150,
        isEarned: false,
        earnedDate: nil
    ),
    Achievement(
        id: "points_1000",
        title: "1000 điểm thưởng",
        description: "Đạt được 1000 điểm thưởng",
        icon: "⭐",
        points: 200,
        isEarned: false,
        earnedDate: nil
    ),
    Achievement(
        id: "course_complete",
        title: "Hoàn thành toàn bộ khóa học",
        description: "Hoàn thành toàn bộ khóa học",
        icon: "🚀",
        points: 500,
        isEarned: false,
        earnedDate: nil
    )
]