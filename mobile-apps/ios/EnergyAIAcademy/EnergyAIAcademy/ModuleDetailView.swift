import SwiftUI

// MARK: - Module Detail View
struct ModuleDetailView: View {
    let module: Module
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appState: AppState
    @State private var selectedLesson: Microlesson?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Hero Section
                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(alignment: .top, spacing: 16) {
                                Text(module.icon)
                                    .font(.system(size: 48))
                                    .frame(width: 70, height: 70)
                                    .background(
                                        Circle()
                                            .fill(LinearGradient.glassCard)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.primaryBrand.opacity(0.3), lineWidth: 2)
                                            )
                                    )
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(module.title)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.textPrimary)
                                        .lineLimit(nil)
                                    
                                    HStack(spacing: 16) {
                                        InfoChip(icon: "clock", text: "\(Int(module.duration / 60)) phút")
                                        InfoChip(icon: "book", text: "\(module.microlessons.count) bài học")
                                    }
                                    
                                    if module.status != .locked {
                                        HStack(spacing: 12) {
                                            SwiftUI.ProgressView(value: module.progress)
                                                .progressViewStyle(LinearProgressViewStyle(tint: Color.primaryBrand))
                                                .frame(height: 6)
                                                .background(Color.gray100)
                                                .cornerRadius(3)
                                            
                                            Text("\(Int(module.progress * 100))%")
                                                .font(.system(size: 14, weight: .bold))
                                                .foregroundColor(.primaryBrand)
                                        }
                                    }
                                }
                            }
                            
                            Text(module.description)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.textSecondary)
                                .lineLimit(nil)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Learning Objectives
                    if !module.learningObjectives.isEmpty {
                        GlassCard {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Mục Tiêu Học Tập")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.textPrimary)
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(module.learningObjectives, id: \.self) { objective in
                                        HStack(alignment: .top, spacing: 12) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.successGreen)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text(objective)
                                                .font(.system(size: 15, weight: .regular))
                                                .foregroundColor(.textSecondary)
                                                .lineLimit(nil)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    // Lessons List
                    if !module.microlessons.isEmpty {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Danh Sách Bài Học")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.textPrimary)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 12) {
                                ForEach(Array(module.microlessons.enumerated()), id: \.element.id) { index, lesson in
                                    LessonRow(
                                        lesson: lesson,
                                        index: index,
                                        onTap: {
                                            if lesson.status != .locked {
                                                selectedLesson = lesson
                                            }
                                        }
                                    )
                                    .padding(.horizontal, 20)
                                }
                            }
                        }
                    }
                    
                    // Key Outcome
                    GradientCard {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "target")
                                    .foregroundColor(.accentOrange)
                                    .font(.system(size: 20, weight: .medium))
                                
                                Text("Kết Quả Chính")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.textPrimary)
                            }
                            
                            Text(module.keyOutcome)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.textPrimary)
                                .lineLimit(nil)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Action Button
                    if module.status != .locked {
                        Button(action: {
                            // Start or continue module
                            if let currentLesson = module.microlessons.first(where: { $0.status == .current }) {
                                selectedLesson = currentLesson
                            } else if let firstLesson = module.microlessons.first {
                                selectedLesson = firstLesson
                            }
                        }) {
                            HStack {
                                Image(systemName: module.status == .completed ? "checkmark" : "play.fill")
                                    .font(.system(size: 16, weight: .semibold))
                                Text(module.status == .completed ? "Ôn tập" : "Bắt đầu học")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(LinearGradient.primaryBrand)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            .background(Color.backgroundLight)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Đóng") {
                        dismiss()
                    }
                    .foregroundColor(.primaryBrand)
                }
            }
        }
        .sheet(item: $selectedLesson) { lesson in
            LessonDetailView(lesson: lesson, module: module)
        }
    }
}

// MARK: - Helper Components
struct InfoChip: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.textMuted)
            
            Text(text)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.textMuted)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(Color.gray100)
        )
    }
}

struct LessonRow: View {
    let lesson: Microlesson
    let index: Int
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                // Lesson number or status icon
                ZStack {
                    Circle()
                        .fill(statusBackgroundColor)
                        .frame(width: 40, height: 40)
                    
                    if lesson.status == .completed {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    } else {
                        Text("\(index + 1)")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(statusTextColor)
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(lesson.title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.textPrimary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Image(systemName: "clock")
                                .font(.system(size: 12))
                                .foregroundColor(.textMuted)
                            Text("\(Int(lesson.duration / 60)) phút")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.textMuted)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.accentOrange)
                            Text("\(lesson.points) điểm")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.accentOrange)
                        }
                        
                        Spacer()
                        
                        if lesson.status == .current {
                            Text("TIẾP TỤC")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.primaryBrand)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    Capsule()
                                        .fill(Color.primaryBrand.opacity(0.1))
                                )
                        }
                    }
                }
                
                Spacer()
                
                if lesson.status != .locked {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.textMuted)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor, lineWidth: 1)
                    )
            )
            .opacity(lesson.status == .locked ? 0.6 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(lesson.status == .locked)
    }
    
    private var statusBackgroundColor: Color {
        switch lesson.status {
        case .completed: return .successGreen
        case .current: return .primaryBrand
        case .locked: return .gray300
        }
    }
    
    private var statusTextColor: Color {
        switch lesson.status {
        case .completed: return .white
        case .current: return .white
        case .locked: return .textMuted
        }
    }
    
    private var borderColor: Color {
        switch lesson.status {
        case .completed: return .successGreen.opacity(0.3)
        case .current: return .primaryBrand.opacity(0.3)
        case .locked: return .gray300.opacity(0.3)
        }
    }
}

// MARK: - Lesson Detail View
struct LessonDetailView: View {
    let lesson: Microlesson
    let module: Module
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Lesson Header
                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(alignment: .top, spacing: 16) {
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient.primaryBrand)
                                        .frame(width: 60, height: 60)
                                    
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 24, weight: .medium))
                                        .foregroundColor(.white)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(lesson.title)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.textPrimary)
                                        .lineLimit(nil)
                                    
                                    HStack(spacing: 16) {
                                        InfoChip(icon: "clock", text: "\(Int(lesson.duration / 60)) phút")
                                        InfoChip(icon: "star", text: "\(lesson.points) điểm")
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Lesson Content Placeholder
                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Nội Dung Bài Học")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.textPrimary)
                            
                            VStack(spacing: 16) {
                                LessonContentSection(
                                    icon: "book",
                                    title: "Nội dung chính",
                                    description: "Video bài giảng và tài liệu học tập chi tiết"
                                )
                                
                                LessonContentSection(
                                    icon: "lightbulb",
                                    title: "Ví dụ thực tế",
                                    description: "Case studies từ ngành năng lượng"
                                )
                                
                                LessonContentSection(
                                    icon: "questionmark.circle",
                                    title: "Kiểm tra hiểu biết",
                                    description: "Quiz tương tác để củng cố kiến thức"
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Coming Soon
                    GradientCard {
                        VStack(spacing: 16) {
                            Image(systemName: "hourglass")
                                .font(.system(size: 40))
                                .foregroundColor(.accentOrange)
                            
                            Text("Nội dung đang được phát triển")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.textPrimary)
                            
                            Text("Bài học chi tiết sẽ sớm có mặt với video, tài liệu và bài tập tương tác.")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.textSecondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 100)
                }
            }
            .background(Color.backgroundLight)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Quay lại") {
                        dismiss()
                    }
                    .foregroundColor(.primaryBrand)
                }
            }
        }
    }
}

struct LessonContentSection: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.primaryBrand)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.textPrimary)
                
                Text(description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.textSecondary)
                    .lineLimit(nil)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}