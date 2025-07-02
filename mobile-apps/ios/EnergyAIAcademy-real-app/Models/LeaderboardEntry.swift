import Foundation

struct LeaderboardEntry: Identifiable, Codable {
    let id: String
    let username: String
    let points: Int
    let rank: Int
    let positionChange: PositionChange
    let isCurrentUser: Bool
}

enum PositionChange: String, Codable {
    case up = "up"
    case down = "down"
    case same = "same"
    case winner = "winner"
}

let sampleLeaderboard: [LeaderboardEntry] = [
    LeaderboardEntry(id: "1", username: "Nguyễn Văn A", points: 1420, rank: 1, positionChange: .winner, isCurrentUser: false),
    LeaderboardEntry(id: "2", username: "Bạn", points: 1250, rank: 2, positionChange: .up, isCurrentUser: true),
    LeaderboardEntry(id: "3", username: "Trần Thị B", points: 980, rank: 3, positionChange: .down, isCurrentUser: false),
    LeaderboardEntry(id: "4", username: "Lê Văn C", points: 845, rank: 4, positionChange: .same, isCurrentUser: false),
    LeaderboardEntry(id: "5", username: "Phạm Thị D", points: 720, rank: 5, positionChange: .same, isCurrentUser: false)
]