import SwiftUI

// MARK: - Liquid Glass Design System Colors
extension Color {
    // Primary Brand Colors
    static let purple700 = Color(red: 0.42, green: 0.27, blue: 0.76) // #6B46C1
    static let violet600 = Color(red: 0.49, green: 0.23, blue: 0.93) // #7C3AED
    static let violet500 = Color(red: 0.55, green: 0.36, blue: 0.96) // #8B5CF6
    static let pink500 = Color(red: 0.93, green: 0.28, blue: 0.60) // #EC4899
    static let orange500 = Color(red: 0.98, green: 0.45, blue: 0.09) // #F97316
    static let yellow500 = Color(red: 0.92, green: 0.70, blue: 0.03) // #EAB308
    static let green500 = Color(red: 0.13, green: 0.77, blue: 0.37) // #22C55E
    static let cyan500 = Color(red: 0.02, green: 0.71, blue: 0.83) // #06B6D4
    
    // Neutral Colors
    static let lightGray = Color(red: 0.98, green: 0.98, blue: 0.98) // #F9FAFB
    static let gray100 = Color(red: 0.95, green: 0.96, blue: 0.96) // #F3F4F6
    static let gray300 = Color(red: 0.90, green: 0.91, blue: 0.92) // #E5E7EB
    static let gray500 = Color(red: 0.42, green: 0.45, blue: 0.50) // #6B7280
    static let gray400 = Color(red: 0.61, green: 0.64, blue: 0.69) // #9CA3AF
    static let gray700 = Color(red: 0.22, green: 0.26, blue: 0.32) // #374151
    
    // Success/Status Colors
    static let emerald500 = Color(red: 0.06, green: 0.72, blue: 0.51) // #10B981
    static let emerald700 = Color(red: 0.02, green: 0.47, blue: 0.34) // #047857
    static let amber500 = Color(red: 0.96, green: 0.62, blue: 0.04) // #F59E0B
    static let red600 = Color(red: 0.86, green: 0.15, blue: 0.15) // #DC2626
    
    // Computed Properties for Easy Access
    static let primaryBrand = violet500
    static let accentPink = pink500
    static let accentOrange = orange500
    static let successGreen = emerald500
    static let warningYellow = amber500
    static let errorRed = red600
    static let backgroundLight = lightGray
    static let textPrimary = gray700
    static let textSecondary = gray500
    static let textMuted = gray400
}

// MARK: - Liquid Glass Gradients
extension LinearGradient {
    static let rainbowHero = LinearGradient(
        colors: [
            .purple700, .violet600, .violet500, .pink500,
            .orange500, .yellow500, .green500, .cyan500
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let primaryBrand = LinearGradient(
        colors: [.violet500, .pink500],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let glassCard = LinearGradient(
        colors: [
            Color.violet500.opacity(0.1),
            Color.pink500.opacity(0.1)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}