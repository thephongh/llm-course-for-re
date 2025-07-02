# EnergyAI Academy - Xcode Project Setup

## 1. Project Configuration

### App Information
- **Display Name**: Học Viện EnergyAI
- **Bundle Identifier**: com.yourcompany.energyai-academy
- **Version**: 1.0.0
- **Build**: 1
- **Minimum iOS Version**: 15.0
- **Target Devices**: iPhone, iPad

### Required Capabilities
- Background App Refresh (for offline content)
- Push Notifications (for daily reminders)
- Network (for content updates)

## 2. Info.plist Configuration

Add these keys to your Info.plist:

```xml
<key>CFBundleDisplayName</key>
<string>Học Viện EnergyAI</string>

<key>NSUserNotificationUsageDescription</key>
<string>Nhận thông báo nhắc nhở học tập hàng ngày</string>

<key>UIRequiredDeviceCapabilities</key>
<array>
    <string>armv7</string>
</array>

<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
    <string>UIInterfaceOrientationLandscapeLeft</string>
    <string>UIInterfaceOrientationLandscapeRight</string>
</array>
```

## 3. App Icons & Launch Screen

### App Icon Requirements
Create app icons for all sizes:
- 1024x1024 (App Store)
- 180x180 (iPhone @3x)
- 120x120 (iPhone @2x)
- 152x152 (iPad @2x)
- 76x76 (iPad @1x)

### Launch Screen
Use SwiftUI LaunchScreen.storyboard with:
- EnergyAI logo
- Gradient background matching app theme
- Loading indicator

## 4. Build Settings

### Deployment
- iOS Deployment Target: 15.0
- Supported Devices: Universal (iPhone + iPad)
- Device Orientation: Portrait, Landscape

### Signing & Capabilities
- Automatically manage signing: ✓
- Team: Your Apple Developer Team
- Bundle Identifier: com.yourcompany.energyai-academy

### App Store Distribution
- Release Configuration
- Bitcode: Yes
- Strip Debug Symbols: Yes