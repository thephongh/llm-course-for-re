import SwiftUI
import Foundation

// MARK: - Models
struct Module: Identifiable, Codable {
    let id: Int
    let title: String
    let duration: TimeInterval
    let microlessons: [Microlesson]
    let status: ModuleStatus
    let progress: Double
    let icon: String
    let unlockRequirement: String?
    let description: String
    let learningObjectives: [String]
    let keyOutcome: String
}

enum ModuleStatus: String, CaseIterable, Codable {
    case completed = "completed"
    case current = "current"
    case locked = "locked"
}

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

struct UserProgress: Codable {
    var totalProgress: Double = 0.89
    var completedModules: Int = 2
    var totalModules: Int = 5
    var streakDays: Int = 12
    var totalPoints: Int = 2450
}

struct Achievement: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let isEarned: Bool
    let points: Int
}

struct LeaderboardEntry: Identifiable {
    let id: String
    let username: String
    let points: Int
    let rank: Int
    let isCurrentUser: Bool
    let positionChange: PositionChange
}

enum PositionChange {
    case winner
    case up
    case down
    case same
}

// MARK: - Complete Module Data
let sampleModules: [Module] = [
    Module(
        id: 1,
        title: "🧠 AI Cơ Bản & Ứng Dụng Năng Lượng",
        duration: 2520, // 42 minutes
        microlessons: [
            Microlesson(id: "1.1", title: "Giới thiệu khóa học & mục tiêu", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.2", title: "AI, Machine Learning & Deep Learning", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.3", title: "Generative AI - Khái niệm cốt lõi", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.4", title: "Ứng dụng AI trong ngành năng lượng", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.5", title: "Dự đoán bảo trì và tối ưu hóa", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.6", title: "Kiểm tra kiến thức Module 1", duration: 420, points: 100, status: .completed)
        ],
        status: .completed,
        progress: 1.0,
        icon: "🧠",
        unlockRequirement: nil,
        description: "Xây dựng nền tảng hiểu biết về AI, Machine Learning và Generative AI với các ví dụ thực tế từ ngành năng lượng. Sơ đồ tương tác và case studies giúp làm rõ những khái niệm phức tạp.",
        learningObjectives: [
            "Định nghĩa rõ ràng và phân biệt AI, ML, và Generative AI",
            "Ứng dụng trong ngành năng lượng và use cases",
            "Ví dụ dự đoán bảo trì thực tế",
            "Kiểm tra kiến thức tương tác"
        ],
        keyOutcome: "Tự tin giải thích các khái niệm AI và xác định cơ hội trong công việc năng lượng của bạn."
    ),
    Module(
        id: 2,
        title: "🤖 Hiểu Về Mô Hình Ngôn Ngữ Lớn (LLMs)",
        duration: 2520,
        microlessons: [
            Microlesson(id: "2.1", title: "Large Language Models là gì?", duration: 420, points: 50, status: .completed),
            Microlesson(id: "2.2", title: "Tokens và Parameters", duration: 420, points: 50, status: .completed),
            Microlesson(id: "2.3", title: "Kiến trúc Transformer", duration: 420, points: 50, status: .completed),
            Microlesson(id: "2.4", title: "Ứng dụng LLM trong tài liệu năng lượng", duration: 420, points: 50, status: .current),
            Microlesson(id: "2.5", title: "Hạn chế và thách thức", duration: 420, points: 50, status: .completed),
            Microlesson(id: "2.6", title: "Kiểm tra kiến thức Module 2", duration: 420, points: 100, status: .completed)
        ],
        status: .current,
        progress: 0.83,
        icon: "🤖",
        unlockRequirement: nil,
        description: "Khám phá sâu cách LLMs hoạt động với giải thích trực quan về tokens, parameters và transformers. Xem chính xác cách các mô hình này xử lý và tạo văn bản.",
        learningObjectives: [
            "Kiến trúc và thành phần của LLM",
            "Cơ chế xử lý token",
            "Khả năng và hạn chế của mô hình",
            "Ứng dụng tài liệu năng lượng"
        ],
        keyOutcome: "Hiểu cách LLMs hoạt động và hạn chế của chúng trong sử dụng chuyên nghiệp."
    ),
    Module(
        id: 3,
        title: "💬 AI Chatbots Trong Công Việc Năng Lượng",
        duration: 2520,
        microlessons: [
            Microlesson(id: "3.1", title: "Tổng quan các nền tảng Chatbot", duration: 420, points: 50, status: .completed),
            Microlesson(id: "3.2", title: "ChatGPT, Gemini, Claude, Perplexity AI", duration: 420, points: 50, status: .completed),
            Microlesson(id: "3.3", title: "Tích hợp vào quy trình làm việc", duration: 420, points: 50, status: .completed),
            Microlesson(id: "3.4", title: "Lập kế hoạch dự án với AI", duration: 420, points: 50, status: .current),
            Microlesson(id: "3.5", title: "Giao tiếp với stakeholder", duration: 420, points: 50, status: .completed),
            Microlesson(id: "3.6", title: "Kiểm tra kiến thức Module 3", duration: 420, points: 100, status: .completed)
        ],
        status: .current,
        progress: 0.83,
        icon: "💬",
        unlockRequirement: nil,
        description: "Khám phá ứng dụng chatbot thực tế với demos tương tác. Học cách tích hợp AI assistants vào lập kế hoạch dự án, phân tích và giao tiếp stakeholder.",
        learningObjectives: [
            "Khả năng nền tảng chatbot (ChatGPT, Gemini, Claude, Perplexity AI)",
            "Chiến lược tích hợp workflow năng lượng",
            "Scenarios thực hành hands-on",
            "Use cases chuyên nghiệp"
        ],
        keyOutcome: "Sử dụng hiệu quả AI chatbots để nâng cao công việc hàng ngày trong ngành năng lượng."
    ),
    Module(
        id: 4,
        title: "✍️ Làm Chủ Kỹ Thuật Prompt Engineering",
        duration: 2520,
        microlessons: [
            Microlesson(id: "4.1", title: "Nguyên tắc cơ bản của Prompt", duration: 420, points: 50, status: .completed),
            Microlesson(id: "4.2", title: "Templates cho ngành năng lượng", duration: 420, points: 50, status: .completed),
            Microlesson(id: "4.3", title: "Kỹ thuật Prompting nâng cao", duration: 420, points: 50, status: .completed),
            Microlesson(id: "4.4", title: "Prompt Builder tương tác", duration: 420, points: 50, status: .completed),
            Microlesson(id: "4.5", title: "Thực hành với ví dụ thực tế", duration: 420, points: 50, status: .current),
            Microlesson(id: "4.6", title: "Kiểm tra kiến thức Module 4", duration: 420, points: 100, status: .completed)
        ],
        status: .current,
        progress: 0.83,
        icon: "✍️",
        unlockRequirement: nil,
        description: "Học nghệ thuật tạo prompts hiệu quả thông qua bài tập tương tác. Thực hành với templates chuyên biệt cho năng lượng và xem kết quả ngay lập tức.",
        learningObjectives: [
            "Nguyên tắc framework prompt",
            "Templates chuyên biệt cho năng lượng",
            "Kỹ thuật prompting nâng cao",
            "Prompt builder tương tác"
        ],
        keyOutcome: "Tạo các prompts mạnh mẽ để có kết quả tối ưu cho ứng dụng năng lượng."
    ),
    Module(
        id: 5,
        title: "🛡️ Đạo Đức & Thực Hành An Toàn",
        duration: 2520,
        microlessons: [
            Microlesson(id: "5.1", title: "Đạo đức AI trong cơ sở hạ tầng năng lượng", duration: 420, points: 50, status: .completed),
            Microlesson(id: "5.2", title: "Bảo mật dữ liệu và quyền riêng tư", duration: 420, points: 50, status: .completed),
            Microlesson(id: "5.3", title: "Kỹ thuật xác minh thông tin", duration: 420, points: 50, status: .completed),
            Microlesson(id: "5.4", title: "Framework triển khai có trách nhiệm", duration: 420, points: 50, status: .completed),
            Microlesson(id: "5.5", title: "Case studies an toàn", duration: 420, points: 50, status: .completed),
            Microlesson(id: "5.6", title: "Kiểm tra kiến thức Module 5", duration: 420, points: 100, status: .completed)
        ],
        status: .completed,
        progress: 1.0,
        icon: "🛡️",
        unlockRequirement: nil,
        description: "Thành thạo việc sử dụng AI có trách nhiệm với scenarios tương tác chuyên biệt cho cơ sở hạ tầng năng lượng. Học các kỹ thuật bảo mật và xác minh quan trọng.",
        learningObjectives: [
            "Scenarios đạo đức năng lượng",
            "Guidelines bảo mật và bảo vệ dữ liệu",
            "Kỹ thuật xác minh",
            "Frameworks triển khai AI có trách nhiệm"
        ],
        keyOutcome: "Triển khai giải pháp AI an toàn và có trách nhiệm trong cơ sở hạ tầng năng lượng."
    )
]

let sampleAchievements: [Achievement] = [
    Achievement(id: "first_lesson", title: "Bài đầu tiên", description: "Hoàn thành bài học đầu tiên", icon: "🎯", isEarned: true, points: 50),
    Achievement(id: "week_streak", title: "Tuần liên tiếp", description: "Học 7 ngày liên tiếp", icon: "🔥", isEarned: true, points: 100),
    Achievement(id: "module_complete", title: "Hoàn thành mô-đun", description: "Hoàn thành mô-đun đầu tiên", icon: "🏆", isEarned: true, points: 200),
    Achievement(id: "ai_expert", title: "Chuyên gia AI", description: "Đạt 90% trở lên tất cả bài kiểm tra", icon: "🧠", isEarned: true, points: 500),
    Achievement(id: "practice_master", title: "Thạc sĩ thực hành", description: "Hoàn thành 50 bài tập thực hành", icon: "⚡", isEarned: true, points: 300),
    Achievement(id: "community_helper", title: "Trợ giúp cộng đồng", description: "Giúp đỡ 10 người học khác", icon: "🤝", isEarned: false, points: 150)
]

let sampleLeaderboard: [LeaderboardEntry] = [
    LeaderboardEntry(id: "1", username: "Phong Han", points: 2450, rank: 1, isCurrentUser: true, positionChange: .winner),
    LeaderboardEntry(id: "2", username: "Minh Anh", points: 2180, rank: 2, isCurrentUser: false, positionChange: .up),
    LeaderboardEntry(id: "3", username: "Hoàng Long", points: 1950, rank: 3, isCurrentUser: false, positionChange: .down),
    LeaderboardEntry(id: "4", username: "Thu Hà", points: 1780, rank: 4, isCurrentUser: false, positionChange: .same),
    LeaderboardEntry(id: "5", username: "Văn Đạt", points: 1650, rank: 5, isCurrentUser: false, positionChange: .up)
]

// MARK: - App State
class AppState: ObservableObject {
    @Published var selectedTab: TabBarView.Tab = .home
    @Published var userProgress = UserProgress()
    @Published var modules: [Module] = []
    @Published var achievements: [Achievement] = []
    
    init() {
        loadInitialData()
    }
    
    private func loadInitialData() {
        modules = sampleModules
        achievements = sampleAchievements
    }
}