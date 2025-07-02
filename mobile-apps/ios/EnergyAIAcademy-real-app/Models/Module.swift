import Foundation

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

let sampleModules: [Module] = [
    Module(
        id: 1,
        title: "Mô-đun 1: AI Cơ Bản & Ứng Dụng Năng Lượng",
        duration: 2520, // 42 minutes in seconds
        microlessons: [
            Microlesson(id: "1.1", title: "Giới thiệu khóa học & mục tiêu", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.2", title: "Trí tuệ nhân tạo - Nền tảng", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.3", title: "Machine Learning - Máy học", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.4", title: "Generative AI - AI sáng tạo", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.5", title: "Ứng dụng trong ngành năng lượng", duration: 420, points: 50, status: .completed),
            Microlesson(id: "1.6", title: "Kiểm tra kiến thức", duration: 420, points: 100, status: .completed)
        ],
        status: .completed,
        progress: 1.0,
        icon: "✅",
        unlockRequirement: nil
    ),
    Module(
        id: 2,
        title: "Mô-đun 2: Hiểu Về Mô Hình Ngôn Ngữ Lớn",
        duration: 2520,
        microlessons: [
            Microlesson(id: "2.1", title: "Mô hình ngôn ngữ lớn là gì?", duration: 420, points: 50, status: .completed),
            Microlesson(id: "2.2", title: "Xử lý thông tin (Tokens & Parameters)", duration: 420, points: 50, status: .completed),
            Microlesson(id: "2.3", title: "Kiến trúc Transformer", duration: 420, points: 50, status: .current),
            Microlesson(id: "2.4", title: "Ứng dụng LLM trong năng lượng", duration: 420, points: 50, status: .locked),
            Microlesson(id: "2.5", title: "Hạn chế & lưu ý", duration: 420, points: 50, status: .locked),
            Microlesson(id: "2.6", title: "Kiểm tra kiến thức", duration: 420, points: 100, status: .locked)
        ],
        status: .current,
        progress: 0.33,
        icon: "📚",
        unlockRequirement: nil
    ),
    Module(
        id: 3,
        title: "Mô-đun 3: AI Chatbot Trong Công Việc Năng Lượng",
        duration: 2520,
        microlessons: [],
        status: .locked,
        progress: 0.0,
        icon: "🔒",
        unlockRequirement: "Hoàn thành Mô-đun 2"
    ),
    Module(
        id: 4,
        title: "Mô-đun 4: Làm Chủ Kỹ Thuật Prompt",
        duration: 2520,
        microlessons: [],
        status: .locked,
        progress: 0.0,
        icon: "🔒",
        unlockRequirement: "Hoàn thành Mô-đun 3"
    ),
    Module(
        id: 5,
        title: "Mô-đun 5: Đạo Đức & Thực Hành Tốt Nhất",
        duration: 2520,
        microlessons: [],
        status: .locked,
        progress: 0.0,
        icon: "🔒",
        unlockRequirement: "Hoàn thành Mô-đun 4"
    )
]