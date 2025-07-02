# Backend Integration & Data Persistence

## 1. Local Data Storage (Core Data)

### Core Data Stack Setup
```swift
// DataManager.swift
import CoreData

class DataManager: ObservableObject {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EnergyAIAcademy")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data error: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func save() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
```

### Core Data Model Entities
```swift
// UserProgressEntity+CoreDataClass.swift
@objc(UserProgressEntity)
public class UserProgressEntity: NSManagedObject {
    @NSManaged public var totalProgress: Double
    @NSManaged public var points: Int32
    @NSManaged public var streak: Int32
    @NSManaged public var level: String
    @NSManaged public var completedLessons: Int32
    @NSManaged public var lastUpdated: Date
}

// ModuleEntity+CoreDataClass.swift
@objc(ModuleEntity)
public class ModuleEntity: NSManagedObject {
    @NSManaged public var id: Int32
    @NSManaged public var title: String
    @NSManaged public var progress: Double
    @NSManaged public var status: String
    @NSManaged public var isDownloaded: Bool
    @NSManaged public var microlessons: NSSet?
}
```

## 2. Backend API Architecture

### Firebase Setup (Recommended)
```swift
// FirebaseManager.swift
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FirebaseManager: ObservableObject {
    init() {
        FirebaseApp.configure()
    }
    
    private let db = Firestore.firestore()
    private let auth = Auth.auth()
    
    // User Authentication
    func signInAnonymously() async throws {
        try await auth.signInAnonymously()
    }
    
    // Sync user progress
    func syncUserProgress(_ progress: UserProgress) async throws {
        guard let userId = auth.currentUser?.uid else { return }
        
        let data: [String: Any] = [
            "totalProgress": progress.totalProgress,
            "points": progress.points,
            "streak": progress.streak,
            "level": progress.level,
            "lastUpdated": Timestamp(date: Date())
        ]
        
        try await db.collection("users").document(userId).setData(data, merge: true)
    }
    
    // Fetch latest modules
    func fetchModules() async throws -> [Module] {
        let snapshot = try await db.collection("modules")
            .order(by: "id")
            .getDocuments()
        
        return snapshot.documents.compactMap { doc in
            try? doc.data(as: Module.self)
        }
    }
}
```

### REST API Alternative
```swift
// APIManager.swift
class APIManager {
    static let shared = APIManager()
    private let baseURL = "https://api.energyai.com/v1"
    
    func fetchModules() async throws -> [Module] {
        let url = URL(string: "\(baseURL)/modules")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Module].self, from: data)
    }
    
    func updateUserProgress(_ progress: UserProgress) async throws {
        let url = URL(string: "\(baseURL)/users/progress")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(progress)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APIError.updateFailed
        }
    }
}

enum APIError: Error {
    case updateFailed
    case networkError
    case invalidData
}
```

## 3. Offline-First Architecture

### Sync Manager
```swift
// SyncManager.swift
class SyncManager: ObservableObject {
    @Published var syncStatus: SyncStatus = .idle
    
    private let dataManager = DataManager()
    private let apiManager = APIManager.shared
    
    enum SyncStatus {
        case idle, syncing, success, failed
    }
    
    func syncData() async {
        await MainActor.run { syncStatus = .syncing }
        
        do {
            // 1. Upload local changes
            try await uploadLocalChanges()
            
            // 2. Download remote updates
            try await downloadRemoteUpdates()
            
            await MainActor.run { syncStatus = .success }
        } catch {
            await MainActor.run { syncStatus = .failed }
        }
    }
    
    private func uploadLocalChanges() async throws {
        // Upload user progress, completed lessons, etc.
        let localProgress = fetchLocalUserProgress()
        try await apiManager.updateUserProgress(localProgress)
    }
    
    private func downloadRemoteUpdates() async throws {
        // Download new modules, updated content
        let remoteModules = try await apiManager.fetchModules()
        updateLocalModules(remoteModules)
    }
}
```

## 4. Content Delivery Network (CDN)

### Media Download Manager
```swift
// MediaDownloadManager.swift
class MediaDownloadManager: ObservableObject {
    @Published var downloadProgress: [String: Double] = [:]
    @Published var downloadedContent: Set<String> = []
    
    func downloadModuleContent(_ module: Module) async {
        for microlesson in module.microlessons {
            if let videoURL = microlesson.videoURL {
                await downloadVideo(videoURL, id: microlesson.id)
            }
        }
    }
    
    private func downloadVideo(_ url: URL, id: String) async {
        let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, _, error in
            guard let localURL = localURL else { return }
            
            // Move to app documents directory
            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let destinationURL = documentsPath.appendingPathComponent("\(id).mp4")
            
            try? FileManager.default.moveItem(at: localURL, to: destinationURL)
            
            DispatchQueue.main.async {
                self?.downloadedContent.insert(id)
            }
        }
        
        task.resume()
    }
}
```

## 5. Push Notifications

### Notification Manager
```swift
// NotificationManager.swift
import UserNotifications

class NotificationManager: ObservableObject {
    func requestPermission() async {
        try? await UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound])
    }
    
    func scheduleDailyReminder(at time: DateComponents) {
        let content = UNMutableNotificationContent()
        content.title = "Học Viện EnergyAI"
        content.body = "Đã đến giờ học tập hôm nay! 🚀"
        content.sound = .default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
        let request = UNNotificationRequest(identifier: "daily_reminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleProgressMilestone(_ achievement: Achievement) {
        let content = UNMutableNotificationContent()
        content.title = "Thành tựu mới! 🏆"
        content.body = "Bạn đã đạt được: \(achievement.title)"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: achievement.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
```

## 6. Analytics & Telemetry

### Firebase Analytics Integration
```swift
// AnalyticsManager.swift
import FirebaseAnalytics

class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    func trackLessonCompleted(_ lessonId: String, module: String, duration: TimeInterval) {
        Analytics.logEvent("lesson_completed", parameters: [
            "lesson_id": lessonId,
            "module": module,
            "duration_seconds": duration,
            "user_level": UserDefaults.standard.string(forKey: "user_level") ?? "unknown"
        ])
    }
    
    func trackPracticeSessionStarted(template: String) {
        Analytics.logEvent("practice_session_started", parameters: [
            "template": template,
            "session_time": Date().timeIntervalSince1970
        ])
    }
    
    func trackUserProgress(progress: Double, module: Int) {
        Analytics.logEvent("progress_updated", parameters: [
            "progress_percentage": progress * 100,
            "current_module": module
        ])
    }
}
```

## 7. Backend Deployment Options

### Option 1: Firebase (Recommended for MVP)
**Pros**: Easy setup, real-time sync, built-in analytics
**Costs**: Free tier covers ~10K users, $25/month for production
```
Services needed:
- Firestore (database)
- Firebase Storage (media files)
- Cloud Functions (server logic)
- Firebase Analytics
- Cloud Messaging (push notifications)
```

### Option 2: AWS + PostgreSQL
**Pros**: Full control, scalable, cost-effective at scale
**Setup**:
```
- EC2/ECS for API server
- RDS PostgreSQL for data
- S3 + CloudFront for media CDN
- SNS for push notifications
- API Gateway for routing
```

### Option 3: Supabase (Firebase Alternative)
**Pros**: Open source, PostgreSQL-based, real-time features
```
Services:
- Supabase Database (PostgreSQL)
- Storage for media files
- Edge Functions for server logic
- Real-time subscriptions
```

This architecture ensures your app can:
- Work offline seamlessly
- Sync data across devices
- Scale to millions of users
- Add new modules without app updates
- Track detailed learning analytics