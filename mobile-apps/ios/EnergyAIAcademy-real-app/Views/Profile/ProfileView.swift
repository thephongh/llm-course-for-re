import SwiftUI

struct ProfileView: View {
    @State private var selectedLanguage = "Tiếng Việt"
    @State private var notificationsEnabled = true
    @State private var dailyReminder = "9:00 Sáng"
    
    private let languages = ["Tiếng Việt", "English"]
    private let reminderTimes = ["9:00 Sáng", "2:00 Chiều", "7:00 Tối"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hồ Sơ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                // Profile Info
                VStack(spacing: 16) {
                    Text("👤")
                        .font(.system(size: 60))
                        .frame(width: 100, height: 100)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(50)
                    
                    VStack(spacing: 4) {
                        Text("Chuyên Gia Năng Lượng")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("Thành viên từ tháng 1/2024")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                // Options
                VStack(alignment: .leading, spacing: 16) {
                    // General Options
                    OptionGroupView(title: "Tùy Chọn") {
                        VStack(spacing: 12) {
                            OptionItemView(title: "Ngôn ngữ") {
                                Picker("Ngôn ngữ", selection: $selectedLanguage) {
                                    ForEach(languages, id: \.self) { language in
                                        Text(language).tag(language)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                            }
                            
                            OptionItemView(title: "Thông báo") {
                                Toggle("", isOn: $notificationsEnabled)
                                    .toggleStyle(SwitchToggleStyle())
                            }
                        }
                    }
                    
                    // Learning Options
                    OptionGroupView(title: "Học Tập") {
                        VStack(spacing: 12) {
                            OptionItemView(title: "Nhắc nhở hằng ngày") {
                                Picker("Nhắc nhở", selection: $dailyReminder) {
                                    ForEach(reminderTimes, id: \.self) { time in
                                        Text(time).tag(time)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                            }
                            
                            OptionItemView(title: "Tải về offline") {
                                Button("Quản lý") {
                                    // Handle offline download management
                                }
                                .font(.subheadline)
                                .foregroundColor(.primaryBlue)
                            }
                        }
                    }
                    
                    // Account Options
                    OptionGroupView(title: "Tài Khoản") {
                        VStack(spacing: 12) {
                            OptionItemView(title: "Xuất tiến độ") {
                                Button("Xuất") {
                                    // Handle progress export
                                }
                                .font(.subheadline)
                                .foregroundColor(.primaryBlue)
                            }
                            
                            OptionItemView(title: "Trợ giúp & Hỗ trợ") {
                                Button("Liên hệ") {
                                    // Handle support contact
                                }
                                .font(.subheadline)
                                .foregroundColor(.primaryBlue)
                            }
                        }
                    }
                }
                
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.gray.opacity(0.1))
    }
}

struct OptionGroupView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct OptionItemView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundColor(.black)
            
            Spacer()
            
            content
        }
        .padding(.vertical, 4)
    }
}