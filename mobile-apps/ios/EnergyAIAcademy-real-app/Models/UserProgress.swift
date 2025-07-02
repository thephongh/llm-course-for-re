import Foundation

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