import SwiftUI

struct FloatingActionButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("🎯")
                .font(.title2)
                .frame(width: 56, height: 56)
                .background(
                    ZStack {
                        // Glass background with primary color
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.primaryBlue,
                                        Color.primaryBlue.opacity(0.8)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        // Glass material overlay
                        Circle()
                            .fill(Material.ultraThinMaterial)
                            .opacity(0.4)
                        
                        // Glass reflection highlight
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.white.opacity(0.6),
                                        Color.white.opacity(0.2),
                                        Color.clear
                                    ],
                                    center: .topLeading,
                                    startRadius: 5,
                                    endRadius: 25
                                )
                            )
                    }
                )
                .overlay(
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.7),
                                    Color.white.opacity(0.2),
                                    Color.clear
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
                .foregroundColor(.white)
                .shadow(
                    color: Color.primaryBlue.opacity(0.4),
                    radius: 12,
                    x: 0,
                    y: 6
                )
        }
        .buttonStyle(LiquidGlassButtonStyle())
    }
}