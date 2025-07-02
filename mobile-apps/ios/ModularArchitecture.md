# Modular Architecture for Future Updates

## 1. Content Management System

### Backend Data Structure
```json
{
  "modules": [
    {
      "id": 6,
      "title": "Mô-đun 6: AI trong Năng Lượng Tái Tạo",
      "description": "Ứng dụng AI cho dự báo và tối ưu hóa năng lượng tái tạo",
      "duration": 2700,
      "prerequisites": [5],
      "status": "locked",
      "microlessons": [
        {
          "id": "6.1",
          "title": "Dự báo sản lượng điện mặt trời",
          "type": "video",
          "content_url": "https://cdn.energyai.com/lessons/6-1.mp4",
          "duration": 450,
          "points": 75
        }
      ],
      "practiceTemplates": [
        {
          "id": "solar_forecasting",
          "title": "Dự Báo Điện Mặt Trời",
          "prompt_template": "Dự báo sản lượng điện mặt trời cho {location} trong {timeframe} với dữ liệu thời tiết: {weather_data}"
        }
      ]
    }
  ]
}
```

### Content Delivery Network (CDN)
```swift
// ContentManager.swift
class ContentManager: ObservableObject {
    @Published var availableModules: [Module] = []
    @Published var downloadedContent: Set<String> = []
    
    func fetchLatestModules() async {
        // Fetch from your backend API
        let url = URL(string: "https://api.energyai.com/modules")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let modules = try JSONDecoder().decode([Module].self, from: data)
        
        await MainActor.run {
            self.availableModules = modules
        }
    }
    
    func downloadModule(_ moduleId: Int) async {
        // Download module content for offline access
        // Store in Core Data or local files
    }
}
```

## 2. Dynamic Module Loading

### Module Factory Pattern
```swift
// ModuleFactory.swift
protocol ModuleProtocol {
    var id: Int { get }
    var title: String { get }
    var viewController: some View { get }
}

class ModuleFactory {
    static func createModule(from data: Module) -> any ModuleProtocol {
        switch data.type {
        case .interactive:
            return InteractiveModule(data: data)
        case .video:
            return VideoModule(data: data)
        case .quiz:
            return QuizModule(data: data)
        case .practice:
            return PracticeModule(data: data)
        }
    }
}

// Example: New Interactive Module
struct InteractiveModule: ModuleProtocol, View {
    let data: Module
    
    var id: Int { data.id }
    var title: String { data.title }
    
    var viewController: some View { self }
    
    var body: some View {
        // Custom interactive content
        InteractiveContentView(module: data)
    }
}
```

## 3. Plugin Architecture

### Module Plugin System
```swift
// PluginManager.swift
class PluginManager: ObservableObject {
    private var registeredPlugins: [String: any ModulePlugin] = [:]
    
    func registerPlugin(_ plugin: any ModulePlugin) {
        registeredPlugins[plugin.identifier] = plugin
    }
    
    func loadPlugin(identifier: String, data: ModuleData) -> AnyView? {
        guard let plugin = registeredPlugins[identifier] else { return nil }
        return AnyView(plugin.createView(data: data))
    }
}

protocol ModulePlugin {
    var identifier: String { get }
    var version: String { get }
    
    func createView(data: ModuleData) -> any View
    func validate(data: ModuleData) -> Bool
}

// Example: AR Module Plugin
struct ARModulePlugin: ModulePlugin {
    let identifier = "ar_module"
    let version = "1.0.0"
    
    func createView(data: ModuleData) -> any View {
        ARModuleView(data: data)
    }
    
    func validate(data: ModuleData) -> Bool {
        // Validate AR capability
        return ARWorldTrackingConfiguration.isSupported
    }
}
```

## 4. Versioning & Updates

### Module Versioning
```swift
// ModuleVersion.swift
struct ModuleVersion: Codable {
    let moduleId: Int
    let version: String
    let requiredAppVersion: String
    let updateType: UpdateType
    let changelog: [String]
    let downloadSize: Int64
}

enum UpdateType: String, Codable {
    case mandatory = "mandatory"
    case optional = "optional"
    case feature = "feature"
}

// Update Manager
class UpdateManager: ObservableObject {
    @Published var availableUpdates: [ModuleVersion] = []
    
    func checkForUpdates() async {
        // Check server for module updates
        // Compare local versions with server versions
        // Prompt user for updates
    }
    
    func installUpdate(_ moduleVersion: ModuleVersion) async {
        // Download and install module update
        // Update local database
        // Refresh UI
    }
}
```

## 5. A/B Testing & Feature Flags

### Feature Flag System
```swift
// FeatureFlags.swift
@propertyWrapper
struct FeatureFlag {
    private let key: String
    private let defaultValue: Bool
    
    init(_ key: String, default defaultValue: Bool = false) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: Bool {
        // Check remote config or local storage
        return RemoteConfig.shared.bool(forKey: key, default: defaultValue)
    }
}

// Usage in Views
struct HomeView: View {
    @FeatureFlag("new_progress_ui") private var showNewProgressUI
    @FeatureFlag("gamification_v2") private var enableGamificationV2
    
    var body: some View {
        VStack {
            if showNewProgressUI {
                NewProgressCircleView()
            } else {
                ProgressCircleView()
            }
            
            if enableGamificationV2 {
                GamificationV2View()
            }
        }
    }
}
```

## 6. Analytics & Telemetry

### Learning Analytics
```swift
// AnalyticsManager.swift
class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    func trackModuleStarted(_ moduleId: Int) {
        let event = AnalyticsEvent(
            name: "module_started",
            parameters: [
                "module_id": moduleId,
                "timestamp": Date(),
                "user_level": UserProgress.shared.level
            ]
        )
        sendEvent(event)
    }
    
    func trackLearningProgress(_ progress: LearningProgress) {
        // Track detailed learning analytics
        // Send to your analytics backend
    }
    
    private func sendEvent(_ event: AnalyticsEvent) {
        // Send to Firebase, Mixpanel, or custom analytics
    }
}
```

## 7. Adding New Module Types

### Step-by-Step Process

1. **Design New Module**:
   ```swift
   // 1. Define new module type
   enum ModuleType: String, Codable {
       case basic, interactive, video, quiz, practice
       case ar = "augmented_reality"        // New!
       case simulation = "3d_simulation"    // New!
       case webinar = "live_webinar"        // New!
   }
   ```

2. **Create Module Implementation**:
   ```swift
   // 2. Implement new module view
   struct ARSolarPanelModule: View, ModuleProtocol {
       let data: Module
       
       var body: some View {
           ARViewContainer()
               .overlay(
                   VStack {
                       Text("Point camera at solar panel")
                       Button("Analyze Efficiency") {
                           analyzePanel()
                       }
                   }
               )
       }
   }
   ```

3. **Register in Module Factory**:
   ```swift
   // 3. Add to factory
   extension ModuleFactory {
       static func createModule(from data: Module) -> any ModuleProtocol {
           switch data.type {
           case .ar:
               return ARSolarPanelModule(data: data)
           // ... existing cases
           }
       }
   }
   ```

4. **Update Backend**:
   ```json
   // 4. Add to content management system
   {
     "id": 7,
     "type": "ar",
     "title": "AR Solar Panel Analysis",
     "ar_models": ["solar_panel_3d.usdz"],
     "detection_targets": ["solar_panel_marker.jpg"]
   }
   ```

This modular architecture allows you to:
- Add new learning modules without app updates
- A/B test new features
- Personalize content per user
- Scale content globally
- Maintain backward compatibility