import Foundation

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