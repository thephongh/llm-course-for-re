# iOS App Structure: AI for Energy Professionals Training

## App Overview
**Name:** Học Viện EnergyAI (EnergyAI Academy)  
**Tagline:** Làm Chủ Công Cụ AI Cho Chuyên Gia Năng Lượng (Master AI Tools for Energy Professionals)  
**Language:** Vietnamese (Primary), English (Secondary)  
**Target Users:** Energy sector professionals including project developers, asset managers, engineers, business development professionals, executives, and regulatory specialists

## Core App Architecture

### 1. Navigation Structure
```
TabBar Navigation:
├── 🏠 Trang Chủ (Home)
├── 📚 Học Tập (Learning Path)
├── 🎯 Thực Hành (Practice Lab)
├── 📊 Tiến Độ (Progress)
└── ⚙️ Hồ Sơ (Profile)
```

**Additional Navigation Elements:**
- **Status Bar**: iOS-style status bar with time and battery indicator
- **Floating Action Button (FAB)**: Quick access to Practice Lab
- **Screen Transitions**: Slide animations between screens

### 2. Module-Based Learning Structure

#### **Mô-đun 1: AI Cơ Bản & Ứng Dụng Năng Lượng** (42 phút)
- **Mục tiêu:** Hiểu sự khác biệt giữa AI, ML và Generative AI với các ví dụ trong ngành năng lượng
- **Các bài học:**
  1. Giới thiệu khóa học & mục tiêu
  2. Trí tuệ nhân tạo - Nền tảng
  3. Machine Learning - Máy học
  4. Generative AI - AI sáng tạo
  5. Ứng dụng trong ngành năng lượng
  6. Kiểm tra kiến thức
- **Trạng thái:** ✅ Đã hoàn thành (100%)

#### **Mô-đun 2: Hiểu Về Mô Hình Ngôn Ngữ Lớn** (42 phút)
- **Mục tiêu:** Tìm hiểu sâu về kiến trúc và khả năng của LLM
- **Các bài học:**
  1. Mô hình ngôn ngữ lớn là gì? ✅
  2. Xử lý thông tin (Tokens & Parameters) ✅
  3. Kiến trúc Transformer 📚 (Đang học)
  4. Ứng dụng LLM trong năng lượng 🔒
  5. Hạn chế & lưu ý 🔒
  6. Kiểm tra kiến thức 🔒
- **Trạng thái:** 📚 Đang học (33%)

#### **Mô-đun 3: AI Chatbot Trong Công Việc Năng Lượng** (42 phút)
- **Mục tiêu:** Ứng dụng thực tế của chatbot và chiến lược tích hợp
- **Trạng thái:** 🔒 Khóa (Hoàn thành Mô-đun 2)

#### **Mô-đun 4: Làm Chủ Kỹ Thuật Prompt** (42 phút)
- **Mục tiêu:** Học cách tạo prompts hiệu quả để có kết quả AI tối ưu
- **Trạng thái:** 🔒 Khóa (Hoàn thành Mô-đun 3)

#### **Mô-đun 5: Đạo Đức & Thực Hành Tốt Nhất** (42 phút)
- **Mục tiêu:** Sử dụng AI có trách nhiệm trong cơ sở hạ tầng năng lượng
- **Trạng thái:** 🔒 Khóa (Hoàn thành Mô-đun 4)

## Key Features & Functionality

### 3. Interactive Learning Features

#### **Step-by-Step Progression**
- Sequential unlocking of content
- Progress indicators with visual feedback
- Completion badges for each step
- Cannot advance without completing prerequisites

#### **Interactive Elements**
- Animated diagrams (AI/ML Venn diagram, LLM architecture)
- Interactive quizzes with immediate feedback
- Hands-on prompt engineering exercises
- Real-time AI tool demos
- Scenario-based learning exercises

#### **Visual Learning Components**
- Progress bars and completion indicators
- Interactive step navigation dots
- Visual content cards with examples
- Before/after prompt comparisons
- Energy sector-specific illustrations

### 4. Practice Lab Features

#### **Prompt Engineering Sandbox**
- Interactive prompt builder interface
- Real-time AI response testing
- Energy-specific template library
- Save and share custom prompts
- Performance analytics

#### **Template Library**
- 6 proven prompt templates:
  1. Market analysis reports
  2. Technical feasibility studies
  3. Financial modeling requests
  4. Competitive landscape analysis
  5. Regulatory compliance analysis
  6. Legal document summarization

#### **Scenario Simulator**
- Real-world energy scenarios
- Ethical decision-making exercises
- Risk assessment simulations
- Regulatory compliance checks

### 5. Progress Tracking System

#### **Completion Metrics**
- Overall course progress (0-100%)
- Module completion status
- Step-by-step progress indicators
- Time invested tracking
- Quiz scores and performance analytics

#### **Achievement System**
- Module completion badges
- Skill mastery certificates
- Streak counters for daily learning
- Leaderboard for team environments

### 6. Content Delivery System

#### **Offline Capability**
- Download modules for offline learning
- Cached progress syncing
- Local storage of completed assessments
- Offline-accessible reference materials

#### **Multi-language Support**
- English and Vietnamese initially
- Expandable language framework
- Localized energy sector examples
- Cultural context adaptations

## Technical Implementation Details

### 7. Data Architecture

#### **User Progress Model**
```swift
struct UserProgress {
    let userId: String
    var completedModules: [ModuleProgress]
    var currentModule: Int
    var currentStep: Int
    var totalTimeSpent: TimeInterval
    var quizScores: [QuizResult]
    var achievements: [Achievement]
}
```

#### **Module Content Model**
```swift
struct Module {
    let id: Int
    let title: String
    let duration: TimeInterval
    let steps: [LearningStep]
    let quiz: Quiz
    let prerequisites: [Int]
}
```

#### **Interactive Content Model**
```swift
struct LearningStep {
    let id: String
    let title: String
    let content: Content
    let interactiveElements: [InteractiveElement]
    let estimatedDuration: TimeInterval
}
```

### 8. Key Screens & UI Components

#### **Trang Chủ (Home Screen)**
- **Progress Overview**: Circular progress indicator showing 20% completion
- **Gamification Stats**: 
  - ⭐ Points: 1,250 điểm
  - 🔥 Streak: 7 ngày liên tiếp  
  - 🏆 Level: Cấp 2 - Học viên AI
- **Learning Statistics Grid**:
  - 8 bài học hoàn thành
  - 56 phút học tập
  - 12 lần thực hành
  - 92% điểm trung bình
- **Action Buttons**: 
  - "Tiếp Tục Học Tập" (Primary)
  - "Thực Hành Nhanh" (Secondary)
- **Recent Achievements**:
  - 🏆 Học Viên AI Cấp 2 (+100 điểm)
  - 🔥 Streaker - 7 ngày liên tiếp (+50 điểm)

#### **Học Tập (Learning Path Screen)**
- **Module Cards** with completion states:
  - ✅ Completed modules (green border)
  - 📚 Current module (gradient background)
  - 🔒 Locked modules (with unlock requirements)
- **Expandable Microlessons**: Each module shows detailed lesson breakdown
- **Progress Indicators**: Visual progress bars for each module
- **Continue Button**: Direct access to current lesson

#### **Thực Hành (Practice Lab Screen)**
- **Template Selector**: 
  - Phân Tích Thị Trường (active)
  - Nghiên Cứu Kỹ Thuật
  - Mô Hình Tài Chính
- **Prompt Builder**: 
  - Large textarea for custom prompts
  - "Kiểm Tra Prompt" button
- **AI Response Display**: 
  - Formatted response with lists and structured content
  - Real-time feedback simulation

#### **Tiến Độ (Progress Screen)**
- **Overall Progress**: Large circular indicator (20% completion)
- **Module Progress Breakdown**:
  - AI Cơ Bản: 100%
  - Mô Hình Ngôn Ngữ Lớn: 33%
- **Achievement Gallery**: 6-badge grid with earned/locked states
- **Weekly Leaderboard**:
  - Current user ranking (#2 with 1,250 points)
  - Top 5 users with points and position changes
  - Visual indicators for ranking movement

#### **Hồ Sơ (Profile Screen)**
- **User Avatar**: 👤 with "Chuyên Gia Năng Lượng" title
- **Settings Groups**:
  - **Tùy Chọn**: Language (Vietnamese/English), Notifications toggle
  - **Học Tập**: Daily reminders, Offline downloads
  - **Tài Khoản**: Progress export, Help & Support

### 9. Engagement & Retention Features

#### **Gamification Elements**
- Progressive unlock system
- Achievement badges
- Learning streaks
- Performance leaderboards
- Social sharing capabilities

#### **Personalization**
- Adaptive learning paths
- Difficulty adjustment based on performance
- Personalized content recommendations
- Custom reminder scheduling

#### **Community Features**
- Discussion forums for each module
- Peer collaboration tools
- Expert Q&A sessions
- Industry best practice sharing

### 10. Assessment & Certification

#### **Knowledge Checks**
- Multiple choice quizzes
- Scenario-based assessments
- Practical exercises
- Peer review assignments

#### **Certification System**
- Module completion certificates
- Overall course certification
- Professional credential integration
- Industry recognition partnerships

## Current Implementation Status

### ✅ Completed Features (Phase 1)
1. **Navigation System**: Complete 5-tab navigation with smooth transitions
2. **Module Structure**: All 5 modules with detailed microlesson breakdown
3. **Progress Tracking**: Circular progress indicators, completion percentages
4. **Gamification**: Points, streaks, levels, achievement system
5. **User Interface**: Mobile-optimized with Cursor AI design system
6. **Practice Lab**: Template-based prompt engineering interface
7. **Leaderboard**: Weekly ranking system with position tracking
8. **Profile Management**: Settings, language selection, preferences

### 🚧 In Development (Phase 2)
1. Interactive microlesson content delivery
2. Real AI integration for practice lab
3. Assessment and quiz systems
4. Advanced achievement unlocking

### 📋 Planned Features (Phase 3)
1. Offline content caching
2. Push notifications
3. Social sharing capabilities
4. Advanced analytics dashboard

### 🔮 Future Enhancements (Phase 4)
1. Team management tools
2. Corporate reporting
3. Custom content creation
4. Integration APIs

## Technical Implementation Details

### **Design System**: Cursor AI Design System
- **Color Palette**: Gradient backgrounds with glassmorphism effects
- **Typography**: System fonts with proper hierarchy
- **Components**: Cards, buttons, progress indicators
- **Animations**: Smooth transitions and hover effects

### **Responsive Design**: iPhone-Optimized
- **Screen Sizes**: Optimized for iPhone SE to iPhone Pro Max
- **Touch Targets**: Minimum 44px for all interactive elements
- **Accessibility**: Proper contrast ratios and text sizing

## Success Metrics
- Course completion rates (target: >80%)
- User engagement time (target: 3.5+ hours total)
- Knowledge retention scores
- Professional application rates
- User satisfaction ratings
- App store ratings and reviews

## Current App State Summary

The iOS app implementation successfully provides:

1. **Complete Learning Experience**: All 5 modules with 6 microlessons each
2. **Engaging Gamification**: Points, streaks, levels, and achievement system
3. **Progress Tracking**: Visual indicators and detailed analytics
4. **Practice Environment**: Template-based prompt engineering sandbox
5. **Social Elements**: Leaderboard and competitive learning
6. **Personalization**: Profile management and language preferences
7. **Mobile-First Design**: Optimized for iPhone with modern UI/UX

**Current User Journey:**
- User starts with 20% completion (Module 1 complete, Module 2 in progress)
- 1,250 points earned with 7-day learning streak
- Level 2 "AI Learner" status achieved
- Access to practice lab with 3 template types
- Ranked #2 in weekly leaderboard

This structure provides a comprehensive foundation for the AI training course as a native iOS application while maintaining all key educational elements and interactive features that make the learning experience effective and engaging.