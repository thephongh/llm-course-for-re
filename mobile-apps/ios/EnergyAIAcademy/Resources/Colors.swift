import SwiftUI

extension Color {
    // Gradient Colors
    static let gradientPurple = Color(red: 0.42, green: 0.27, blue: 0.76)
    static let gradientBlue = Color(red: 0.02, green: 0.71, blue: 0.84)
    static let gradientPink = Color(red: 0.93, green: 0.28, blue: 0.60)
    static let gradientOrange = Color(red: 0.97, green: 0.44, blue: 0.09)
    
    // App Colors
    static let primaryBlue = Color(red: 0.00, green: 0.48, blue: 1.00)
    static let successGreen = Color(red: 0.20, green: 0.78, blue: 0.35)
    static let warningOrange = Color(red: 1.00, green: 0.23, blue: 0.19)
    
    // Liquid Glass Colors
    static let glassWhite = Color.white.opacity(0.15)
    static let glassBlack = Color.black.opacity(0.05)
    static let glassPrimary = Color.primaryBlue.opacity(0.2)
    static let glassAccent = Color.gradientPurple.opacity(0.15)
    static let glassSurface = Color.white.opacity(0.1)
    
    // Background Colors
    static let homeGradient = LinearGradient(
        colors: [.gradientPurple, .gradientBlue, .gradientPink, .gradientOrange],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let practiceGradient = LinearGradient(
        colors: [Color(red: 0.54, green: 0.35, blue: 0.17), Color(red: 0.85, green: 0.46, blue: 0.02)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Liquid Glass Backgrounds
    static let liquidGlassBackground = LinearGradient(
        colors: [
            Color.gradientPurple.opacity(0.2),
            Color.gradientBlue.opacity(0.15),
            Color.gradientPink.opacity(0.1),
            Color.gradientOrange.opacity(0.15)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}