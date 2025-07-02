import SwiftUI

struct PracticeLabView: View {
    @State private var selectedTemplate = 0
    @State private var promptText = "Phân tích xu hướng thị trường năng lượng tái tạo cho điện mặt trời ở Đông Nam Á, tập trung vào các yếu tố chính sách và cơ hội đầu tư."
    @State private var aiResponse = ""
    @State private var isLoading = false
    
    private let templates = [
        "Phân Tích Thị Trường",
        "Nghiên Cứu Kỹ Thuật",
        "Mô Hình Tài Chính"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 6) {
                    Text("Phòng Thực Hành")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                // Template Selector
                VStack(alignment: .leading, spacing: 12) {
                    Text("Chọn Mẫu")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<templates.count, id: \.self) { index in
                                TemplateCardView(
                                    title: templates[index],
                                    isSelected: selectedTemplate == index
                                ) {
                                    selectedTemplate = index
                                }
                            }
                        }
                        .padding(.horizontal, 1)
                    }
                }
                
                // Prompt Builder
                VStack(alignment: .leading, spacing: 12) {
                    Text("Xây Dựng Prompt")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 12) {
                        TextEditor(text: $promptText)
                            .frame(minHeight: 120)
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(8)
                            .font(.body)
                        
                        PrimaryButton(title: "Kiểm Tra Prompt") {
                            testPrompt()
                        }
                    }
                }
                
                // AI Response
                VStack(alignment: .leading, spacing: 12) {
                    Text("Phản Hồi AI")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            if isLoading {
                                HStack {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .primaryBlue))
                                    Text("Đang xử lý...")
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                            } else {
                                Text(sampleResponse)
                                    .font(.body)
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(minHeight: 200)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(8)
                }
                
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.practiceGradient)
    }
    
    private func testPrompt() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            aiResponse = sampleResponse
        }
    }
    
    private var sampleResponse: String {
        """
        Điện mặt trời ở Đông Nam Á đang trải qua tăng trưởng mạnh mẽ nhờ:
        
        • Mục tiêu năng lượng tái tạo của chính phủ
        • Chi phí tấm pin mặt trời giảm
        • Nhu cầu năng lượng tăng cao
        • Cam kết khí hậu quốc tế
        
        Các cơ hội đầu tư chính bao gồm:
        
        1. Dự án điện mặt trời quy mô lớn
        2. Hệ thống điện mặt trời mái nhà
        3. Công nghệ lưu trữ năng lượng
        4. Lưới điện thông minh
        
        Các yếu tố chính sách quan trọng:
        - Feed-in Tariff (FiT) ưu đãi
        - Miễn thuế nhập khẩu thiết bị
        - Hỗ trợ tài chính từ chính phủ
        - Quy định kỹ thuật thuận lợi
        """
    }
}

struct TemplateCardView: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .black : .white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.white : Color.white.opacity(0.2))
                .cornerRadius(8)
        }
        .buttonStyle(PressedButtonStyle())
    }
}