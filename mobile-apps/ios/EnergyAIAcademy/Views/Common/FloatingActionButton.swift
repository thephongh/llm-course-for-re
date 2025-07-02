import SwiftUI

struct FloatingActionButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("🎯")
                .font(.title2)
                .frame(width: 56, height: 56)
                .background(Color.primaryBlue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PressedButtonStyle())
    }
}