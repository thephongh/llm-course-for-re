import SwiftUI

struct ModuleCardView: View {
    let module: Module
    let onTap: () -> Void
    @State private var showMicrolessons = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                Text(module.icon)
                    .font(.title2)
                    .frame(width: 40, height: 40)
                    .background(backgroundForStatus)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(module.title)
                        .font(.headline)
                        .foregroundColor(textColorForStatus)
                        .lineLimit(2)
                    
                    Text("\(module.microlessons.count) bài học • \(Int(module.duration / 60)) phút")
                        .font(.caption1)
                        .foregroundColor(textColorForStatus.opacity(0.8))
                    
                    ProgressView(value: module.progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .primaryBlue))
                        .frame(height: 4)
                }
                
                Spacer()
                
                if module.status == .current {
                    Button("Tiếp tục") {
                        onTap()
                    }
                    .font(.caption1)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.primaryBlue)
                    .cornerRadius(8)
                }
            }
            
            if showMicrolessons {
                VStack(spacing: 8) {
                    ForEach(module.microlessons) { microlesson in
                        MicrolessonRowView(microlesson: microlesson)
                    }
                }
                .padding(.top, 8)
                .transition(.opacity.combined(with: .slide))
            }
            
            if module.status == .locked {
                Text(module.unlockRequirement ?? "")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding(16)
        .background(
            ZStack {
                cardBackgroundForStatus
                
                // Liquid Glass overlay
                RoundedRectangle(cornerRadius: 12)
                    .fill(Material.ultraThinMaterial)
                    .opacity(glassOpacityForStatus)
                
                // Glass reflection
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.3),
                                Color.white.opacity(0.1),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .center
                        )
                    )
            }
        )
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.4),
                            Color.white.opacity(0.1),
                            borderColorForStatus.opacity(0.3)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
        .shadow(
            color: Color.black.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
        .onTapGesture {
            if module.status != .locked {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showMicrolessons.toggle()
                }
            }
        }
        .disabled(module.status == .locked)
    }
    
    private var backgroundForStatus: Color {
        switch module.status {
        case .completed: return Color.successGreen.opacity(0.1)
        case .current: return Color.white.opacity(0.1)
        case .locked: return Color.gray.opacity(0.1)
        }
    }
    
    private var cardBackgroundForStatus: some View {
        Group {
            switch module.status {
            case .completed:
                Color.white
            case .current:
                Color.homeGradient
            case .locked:
                Color.white
            }
        }
    }
    
    private var borderColorForStatus: Color {
        switch module.status {
        case .completed: return Color.successGreen
        case .current: return Color.clear
        case .locked: return Color.gray.opacity(0.3)
        }
    }
    
    private var textColorForStatus: Color {
        switch module.status {
        case .completed, .locked: return Color.black
        case .current: return Color.white
        }
    }
    
    private var glassOpacityForStatus: Double {
        switch module.status {
        case .completed: return 0.6
        case .current: return 0.3
        case .locked: return 0.8
        }
    }
}

struct MicrolessonRowView: View {
    let microlesson: Microlesson
    
    var body: some View {
        HStack {
            Text(microlesson.title)
                .font(.subheadline)
                .foregroundColor(textColor)
            
            Spacer()
            
            Text("\(Int(microlesson.duration / 60)) phút")
                .font(.caption2)
                .foregroundColor(.secondary)
            
            Text("+\(microlesson.points) điểm")
                .font(.caption2)
                .foregroundColor(.primaryBlue)
        }
        .padding(.vertical, 4)
    }
    
    private var textColor: Color {
        switch microlesson.status {
        case .completed: return .green
        case .current: return .primary
        case .locked: return .gray
        }
    }
}