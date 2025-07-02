import SwiftUI

struct StatusBarView: View {
    var body: some View {
        HStack {
            Text("9:41")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.black)
            
            Spacer()
            
            HStack(spacing: 4) {
                Text("100%")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                
                Image(systemName: "battery.100")
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .frame(height: 44)
        .background(Color.white)
    }
}