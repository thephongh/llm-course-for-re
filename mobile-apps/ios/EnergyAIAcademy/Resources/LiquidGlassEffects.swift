import SwiftUI

// MARK: - Liquid Glass Effects System
struct LiquidGlassEffects {
    
    // MARK: - Glass Materials
    static let primaryGlass = Material.ultraThinMaterial
    static let secondaryGlass = Material.thinMaterial
    static let tertiaryGlass = Material.thickMaterial
    
    // MARK: - Glass Colors with Transparency
    static let glassWhite = Color.white.opacity(0.1)
    static let glassBlack = Color.black.opacity(0.05)
    static let glassPrimary = Color.primaryBlue.opacity(0.15)
    static let glassAccent = Color.gradientPurple.opacity(0.1)
    
    // MARK: - Dynamic Glass Gradients
    static let liquidGradient = LinearGradient(
        colors: [
            Color.white.opacity(0.25),
            Color.white.opacity(0.1),
            Color.clear,
            Color.black.opacity(0.05)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let glassReflection = LinearGradient(
        colors: [
            Color.white.opacity(0.4),
            Color.white.opacity(0.1),
            Color.clear
        ],
        startPoint: .top,
        endPoint: .center
    )
    
    // MARK: - Animated Glass Properties
    static let glassBlur: CGFloat = 20
    static let glassBorder: CGFloat = 0.5
    static let glassCornerRadius: CGFloat = 16
    static let glassOpacity: Double = 0.8
}

// MARK: - Glass Effect Modifier
struct GlassEffect: ViewModifier {
    let intensity: GlassIntensity
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    // Base glass material
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(intensity.material)
                    
                    // Liquid glass overlay
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(LiquidGlassEffects.liquidGradient)
                    
                    // Reflection highlight
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(LiquidGlassEffects.glassReflection)
                        .frame(height: 60)
                        .offset(y: -20)
                        .mask(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(LinearGradient(
                                    colors: [.black, .clear],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ))
                        )
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.3),
                                Color.white.opacity(0.1),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: LiquidGlassEffects.glassBorder
                    )
            )
    }
}

// MARK: - Glass Intensity Levels
enum GlassIntensity {
    case light
    case medium
    case heavy
    
    var material: Material {
        switch self {
        case .light: return LiquidGlassEffects.primaryGlass
        case .medium: return LiquidGlassEffects.secondaryGlass
        case .heavy: return LiquidGlassEffects.tertiaryGlass
        }
    }
}

// MARK: - View Extensions for Glass Effects
extension View {
    func liquidGlass(
        intensity: GlassIntensity = .medium,
        cornerRadius: CGFloat = LiquidGlassEffects.glassCornerRadius
    ) -> some View {
        self.modifier(GlassEffect(intensity: intensity, cornerRadius: cornerRadius))
    }
    
    func glassButton() -> some View {
        self
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .liquidGlass(intensity: .light, cornerRadius: 12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.2),
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blendMode(.overlay)
            )
    }
    
    func glassCard() -> some View {
        self
            .padding(20)
            .liquidGlass(intensity: .medium, cornerRadius: 20)
            .shadow(
                color: Color.black.opacity(0.1),
                radius: 10,
                x: 0,
                y: 4
            )
    }
    
    func glassNavigation() -> some View {
        self
            .liquidGlass(intensity: .heavy, cornerRadius: 0)
            .overlay(
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.1),
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: 1),
                alignment: .top
            )
    }
}

// MARK: - Animated Glass Components
struct AnimatedGlassCard<Content: View>: View {
    let content: Content
    @State private var animationOffset: CGFloat = 0
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .glassCard()
            .overlay(
                // Animated shimmer effect
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.clear,
                                Color.white.opacity(0.3),
                                Color.clear
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .rotationEffect(.degrees(30))
                    .offset(x: animationOffset)
                    .mask(RoundedRectangle(cornerRadius: 20))
            )
            .onAppear {
                withAnimation(
                    .linear(duration: 2)
                    .repeatForever(autoreverses: false)
                ) {
                    animationOffset = 400
                }
            }
    }
}

// MARK: - Glass Background Gradient
struct LiquidGlassBackground: View {
    var body: some View {
        ZStack {
            // Base gradient
            LinearGradient(
                colors: [
                    Color.gradientPurple.opacity(0.3),
                    Color.gradientBlue.opacity(0.2),
                    Color.gradientPink.opacity(0.1),
                    Color.gradientOrange.opacity(0.2)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // Glass overlay texture
            Rectangle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.white.opacity(0.1),
                            Color.clear,
                            Color.black.opacity(0.05)
                        ],
                        center: .topLeading,
                        startRadius: 100,
                        endRadius: 400
                    )
                )
                .blendMode(.overlay)
        }
        .ignoresSafeArea()
    }
}