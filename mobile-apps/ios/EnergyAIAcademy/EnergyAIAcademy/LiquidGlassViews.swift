import SwiftUI

// MARK: - Liquid Glass Design Components

struct GlassCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray300.opacity(0.3), lineWidth: 1)
                    )
            )
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct GradientCard<Content: View>: View {
    let content: Content
    let gradient: LinearGradient
    
    init(gradient: LinearGradient = .glassCard, @ViewBuilder content: () -> Content) {
        self.gradient = gradient
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(gradient)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.violet500.opacity(0.2), lineWidth: 1)
                    )
            )
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct HeroSection: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.system(size: 32, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .background(LinearGradient.primaryBrand)
                .foregroundStyle(LinearGradient.primaryBrand)
                .mask(
                    Text(title)
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                )
            
            Text(subtitle)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.textSecondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}

// MARK: - Enhanced Module Card with Liquid Glass Design
struct LiquidModuleCard: View {
    let module: Module
    @State private var isExpanded = false
    @State private var showingModuleDetail = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with icon and title
            HStack(alignment: .top, spacing: 12) {
                Text(module.icon)
                    .font(.system(size: 28))
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .fill(statusGradient)
                            .overlay(
                                Circle()
                                    .stroke(statusColor.opacity(0.3), lineWidth: 2)
                            )
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(module.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.textPrimary)
                        .lineLimit(2)
                    
                    Text("\(Int(module.duration / 60)) phút • \(module.microlessons.count) bài học")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.textSecondary)
                    
                    if module.status != .locked {
                        HStack(spacing: 8) {
                            SwiftUI.ProgressView(value: module.progress)
                                .progressViewStyle(
                                    LinearProgressViewStyle(
                                        tint: Color.primaryBrand
                                    )
                                )
                                .frame(height: 6)
                                .background(Color.gray100)
                                .cornerRadius(3)
                            
                            Text("\(Int(module.progress * 100))%")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.primaryBrand)
                                .frame(width: 35, alignment: .trailing)
                        }
                    }
                }
                
                Spacer()
                
                Button(action: { withAnimation(.spring()) { isExpanded.toggle() } }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.textSecondary)
                }
            }
            
            // Status indicator
            HStack {
                Text(statusText)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(statusColor)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(statusColor.opacity(0.1))
                            .overlay(
                                Capsule()
                                    .stroke(statusColor.opacity(0.3), lineWidth: 1)
                            )
                    )
                
                Spacer()
            }
            
            // Expandable content
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Text(module.description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.textSecondary)
                        .lineLimit(nil)
                    
                    if !module.learningObjectives.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Mục tiêu học tập:")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.textPrimary)
                            
                            ForEach(module.learningObjectives, id: \.self) { objective in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("•")
                                        .foregroundColor(.primaryBrand)
                                        .font(.system(size: 12, weight: .bold))
                                    Text(objective)
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundColor(.textSecondary)
                                }
                            }
                        }
                    }
                    
                    Text("Kết quả chính: \(module.keyOutcome)")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.primaryBrand)
                        .padding(.top, 4)
                }
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(borderColor, lineWidth: 1)
                )
        )
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
        .opacity(module.status == .locked ? 0.7 : 1.0)
        .scaleEffect(module.status == .locked ? 0.98 : 1.0)
        .onTapGesture {
            if module.status != .locked {
                showingModuleDetail = true
            }
        }
        .sheet(isPresented: $showingModuleDetail) {
            ModuleDetailView(module: module)
        }
    }
    
    private var statusText: String {
        switch module.status {
        case .completed: return "Đã hoàn thành"
        case .current: return "Đang học"
        case .locked: return module.unlockRequirement ?? "Chưa mở khóa"
        }
    }
    
    private var statusColor: Color {
        switch module.status {
        case .completed: return .successGreen
        case .current: return .primaryBrand
        case .locked: return .textMuted
        }
    }
    
    private var statusGradient: LinearGradient {
        switch module.status {
        case .completed:
            return LinearGradient(colors: [.successGreen.opacity(0.2), .successGreen.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .current:
            return LinearGradient.glassCard
        case .locked:
            return LinearGradient(colors: [.gray300.opacity(0.2), .gray300.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
    
    private var borderColor: Color {
        switch module.status {
        case .completed: return .successGreen.opacity(0.3)
        case .current: return .primaryBrand.opacity(0.3)
        case .locked: return .gray300.opacity(0.3)
        }
    }
}

// MARK: - Enhanced Progress Circle with Liquid Glass
struct LiquidProgressCircle: View {
    let progress: Double
    let size: CGFloat
    let lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray100, lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    LinearGradient.primaryBrand,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 4) {
                Text("\(Int(progress * 100))%")
                    .font(.system(size: size * 0.2, weight: .bold))
                    .foregroundStyle(LinearGradient.primaryBrand)
                
                Text("Hoàn thành")
                    .font(.system(size: size * 0.1, weight: .medium))
                    .foregroundColor(.textSecondary)
            }
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Microlesson Row
struct MicrolessonRow: View {
    let microlesson: Microlesson
    let index: Int
    
    var body: some View {
        HStack(spacing: 12) {
            // Step indicator
            ZStack {
                Circle()
                    .fill(statusColor.opacity(0.1))
                    .frame(width: 32, height: 32)
                
                if microlesson.status == .completed {
                    Image(systemName: "checkmark")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Text("\(index + 1)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(statusColor)
                }
            }
            .background(
                Circle()
                    .fill(microlesson.status == .completed ? .successGreen : statusColor.opacity(0.1))
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(microlesson.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.textPrimary)
                    .lineLimit(2)
                
                HStack {
                    Text("\(Int(microlesson.duration / 60)) phút")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.textSecondary)
                    
                    Text("•")
                        .foregroundColor(.textMuted)
                    
                    Text("\(microlesson.points) điểm")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.accentOrange)
                }
            }
            
            Spacer()
            
            if microlesson.status == .current {
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.primaryBrand)
            }
        }
        .padding(.vertical, 8)
        .opacity(microlesson.status == .locked ? 0.5 : 1.0)
    }
    
    private var statusColor: Color {
        switch microlesson.status {
        case .completed: return .successGreen
        case .current: return .primaryBrand
        case .locked: return .textMuted
        }
    }
}