// iOS App JavaScript
class EnergyAIApp {
    constructor() {
        this.currentScreen = 'home';
        this.userProgress = {
            completedModules: 1,
            currentModule: 2,
            totalTimeSpent: 56,
            overallProgress: 20,
            streakDays: 7,
            quizAverage: 92,
            points: 1250,
            level: 2,
            completedLessons: 8,
            practiceAttempts: 12
        };
        this.gamification = {
            dailyLoginReward: 10,
            lessonCompleteReward: 50,
            quizPassReward: 100,
            practiceReward: 25,
            streakMultiplier: 1.5
        };
        this.init();
    }

    init() {
        this.updateProgressCircles();
        this.initializeInteractivity();
        this.startStatusBarTime();
        this.checkDailyLogin();
        this.updateGamificationDisplay();
    }

    // Gamification System
    checkDailyLogin() {
        const lastLoginDate = localStorage.getItem('lastLoginDate');
        const today = new Date().toDateString();
        
        if (lastLoginDate !== today) {
            this.awardPoints(this.gamification.dailyLoginReward, 'Đăng nhập hằng ngày');
            localStorage.setItem('lastLoginDate', today);
            
            // Update streak
            const yesterday = new Date();
            yesterday.setDate(yesterday.getDate() - 1);
            
            if (lastLoginDate === yesterday.toDateString()) {
                this.userProgress.streakDays++;
            } else if (lastLoginDate !== today) {
                this.userProgress.streakDays = 1;
            }
            
            this.updateGamificationDisplay();
        }
    }
    
    awardPoints(points, reason) {
        const multiplier = this.userProgress.streakDays >= 7 ? this.gamification.streakMultiplier : 1;
        const finalPoints = Math.floor(points * multiplier);
        
        this.userProgress.points += finalPoints;
        this.checkLevelUp();
        this.showPointsNotification(finalPoints, reason);
        
        // Save to localStorage
        localStorage.setItem('userProgress', JSON.stringify(this.userProgress));
    }
    
    checkLevelUp() {
        const pointsThresholds = [0, 500, 1000, 2000, 3500, 5500, 8000];
        let newLevel = 1;
        
        for (let i = 0; i < pointsThresholds.length; i++) {
            if (this.userProgress.points >= pointsThresholds[i]) {
                newLevel = i + 1;
            }
        }
        
        if (newLevel > this.userProgress.level) {
            this.userProgress.level = newLevel;
            this.showLevelUpNotification(newLevel);
        }
    }
    
    updateGamificationDisplay() {
        // Update points display
        const pointsNumber = document.querySelector('.points-number');
        if (pointsNumber) {
            pointsNumber.textContent = this.userProgress.points.toLocaleString();
        }
        
        // Update streak display
        const streakNumber = document.querySelector('.streak-number');
        if (streakNumber) {
            streakNumber.textContent = this.userProgress.streakDays;
        }
        
        // Update level display
        const levelNumber = document.querySelector('.level-number');
        if (levelNumber) {
            levelNumber.textContent = `Cấp ${this.userProgress.level}`;
        }
    }
    
    showPointsNotification(points, reason) {
        const notification = document.createElement('div');
        notification.className = 'points-notification';
        notification.innerHTML = `
            <div class="points-icon">⭐</div>
            <div class="points-text">
                <span class="points-amount">+${points} điểm</span>
                <span class="points-reason">${reason}</span>
            </div>
        `;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.classList.add('show');
        }, 100);
        
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                if (document.body.contains(notification)) {
                    document.body.removeChild(notification);
                }
            }, 300);
        }, 3000);
    }
    
    showLevelUpNotification(level) {
        const notification = document.createElement('div');
        notification.className = 'levelup-notification';
        notification.innerHTML = `
            <div class="levelup-icon">🏆</div>
            <div class="levelup-text">
                <span class="levelup-title">Thăng cấp!</span>
                <span class="levelup-desc">Bạn đã đạt Cấp ${level}</span>
            </div>
        `;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.classList.add('show');
        }, 100);
        
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                if (document.body.contains(notification)) {
                    document.body.removeChild(notification);
                }
            }, 300);
        }, 4000);
    }
    
    // Microlesson Navigation
    showMicrolessons(moduleId) {
        const microlessonsDiv = document.getElementById(`microlessons-${moduleId}`);
        if (microlessonsDiv) {
            const isVisible = microlessonsDiv.style.display !== 'none';
            microlessonsDiv.style.display = isVisible ? 'none' : 'block';
            
            if (!isVisible) {
                microlessonsDiv.style.opacity = '0';
                setTimeout(() => {
                    microlessonsDiv.style.opacity = '1';
                }, 50);
            }
        }
    }
    
    startMicrolesson(lessonId) {
        // Award points for starting a lesson
        this.awardPoints(this.gamification.lessonCompleteReward, `Hoàn thành bài ${lessonId}`);
        
        // Show lesson start notification
        this.showPointsNotification(this.gamification.lessonCompleteReward, `Bắt đầu bài ${lessonId}`);
        
        // Navigate to lesson (placeholder)
        console.log(`Starting lesson ${lessonId}`);
    }

    // Screen Navigation
    switchScreen(screenId) {
        const currentScreen = document.querySelector('.screen.active');
        const newScreen = document.getElementById(screenId);
        const tabs = document.querySelectorAll('.tab');
        
        if (currentScreen) {
            currentScreen.classList.remove('active');
        }
        
        if (newScreen) {
            newScreen.classList.add('active');
            this.currentScreen = screenId;
        }

        // Update active tab
        tabs.forEach(tab => tab.classList.remove('active'));
        const activeTab = [...tabs].find(tab => 
            tab.getAttribute('onclick').includes(screenId)
        );
        if (activeTab) {
            activeTab.classList.add('active');
        }

        // Add screen transition animation
        this.animateScreenTransition(newScreen);
    }

    animateScreenTransition(screen) {
        if (screen) {
            screen.style.transform = 'translateX(100%)';
            screen.style.opacity = '0';
            
            setTimeout(() => {
                screen.style.transform = 'translateX(0)';
                screen.style.opacity = '1';
            }, 50);
        }
    }

    // Progress Circle Animation
    updateProgressCircles() {
        const progressCircles = document.querySelectorAll('.progress-circle svg circle:last-child');
        const progressCirclesLarge = document.querySelectorAll('.progress-circle-large svg circle:last-child');
        
        progressCircles.forEach(circle => {
            const progress = this.userProgress.overallProgress;
            const circumference = 2 * Math.PI * 45;
            const offset = circumference - (progress / 100) * circumference;
            
            circle.style.strokeDasharray = circumference;
            circle.style.strokeDashoffset = offset;
        });

        progressCirclesLarge.forEach(circle => {
            const progress = this.userProgress.overallProgress;
            const circumference = 2 * Math.PI * 50;
            const offset = circumference - (progress / 100) * circumference;
            
            circle.style.strokeDasharray = circumference;
            circle.style.strokeDashoffset = offset;
        });
    }

    // Module Interaction
    continueModule(moduleId) {
        this.switchScreen('learning');
        this.highlightCurrentModule();
    }

    highlightCurrentModule() {
        const modules = document.querySelectorAll('.module');
        modules.forEach((module, index) => {
            if (index === this.userProgress.currentModule - 1) {
                module.classList.add('current');
                module.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        });
    }

    // Practice Lab Functionality
    selectTemplate(templateName) {
        const templates = document.querySelectorAll('.template-card');
        templates.forEach(template => template.classList.remove('active'));
        
        event.target.closest('.template-card').classList.add('active');
        this.loadTemplate(templateName);
        
        // Award points for using practice lab
        this.awardPoints(this.gamification.practiceReward, 'Sử dụng Phòng Thực Hành');
    }

    loadTemplate(templateName) {
        const prompts = {
            'Phân Tích Thị Trường': 'Phân tích xu hướng thị trường năng lượng tái tạo cho [loại năng lượng] ở [khu vực], tập trung vào các yếu tố chính sách và cơ hội đầu tư.',
            'Nghiên Cứu Kỹ Thuật': 'Đánh giá tính khả thi kỹ thuật của dự án [loại dự án năng lượng] với công suất [công suất], xem xét các yếu tố địa lý, khí hậu và cơ sở hạ tầng.',
            'Mô Hình Tài Chính': 'Xây dựng mô hình tài chính cho dự án năng lượng [loại dự án] với vốn đầu tư [số vốn], bao gồm phân tích NPV, IRR và thời gian hoàn vốn.'
        };

        const promptInput = document.querySelector('.prompt-input');
        if (promptInput && prompts[templateName]) {
            promptInput.value = prompts[templateName];
            this.animateTextInput(promptInput);
        }
    }

    testPrompt() {
        const promptInput = document.querySelector('.prompt-input');
        const responseArea = document.querySelector('.response-area');
        
        if (promptInput && responseArea) {
            const prompt = promptInput.value.trim();
            if (prompt) {
                this.showLoadingState(responseArea);
                
                setTimeout(() => {
                    this.generateAIResponse(prompt, responseArea);
                    // Award points for testing prompt
                    this.awardPoints(this.gamification.practiceReward, 'Kiểm tra Prompt');
                }, 1500);
            }
        }
    }

    showLoadingState(element) {
        element.innerHTML = '<div class="loading-animation">🤖 Đang xử lý prompt của bạn...</div>';
        element.classList.add('loading');
    }

    generateAIResponse(prompt, responseArea) {
        const responses = [
            {
                content: `
                    <p>Dựa trên phân tích prompt của bạn, đây là những điểm chính:</p>
                    <ul>
                        <li>Thị trường năng lượng tái tạo đang tăng trưởng mạnh mẽ</li>
                        <li>Các chính sách hỗ trợ từ chính phủ đang thúc đẩy đầu tư</li>
                        <li>Chi phí công nghệ giảm tạo cơ hội sinh lời</li>
                        <li>Nhu cầu năng lượng sạch tăng cao từ doanh nghiệp</li>
                    </ul>
                    <p><strong>Khuyến nghị:</strong> Tập trung vào các dự án quy mô trung bình với công nghệ đã được chứng minh.</p>
                `
            },
            {
                content: `
                    <p>Phân tích kỹ thuật cho thấy:</p>
                    <ul>
                        <li>Điều kiện địa lý phù hợp cho dự án</li>
                        <li>Cơ sở hạ tầng hiện tại cần nâng cấp</li>
                        <li>Yêu cầu công nghệ tiên tiến để tối ưu hiệu suất</li>
                        <li>Thời gian triển khai dự kiến 18-24 tháng</li>
                    </ul>
                    <p><strong>Lưu ý:</strong> Cần nghiên cứu thêm về tác động môi trường và xã hội.</p>
                `
            }
        ];

        const randomResponse = responses[Math.floor(Math.random() * responses.length)];
        responseArea.innerHTML = randomResponse.content;
        responseArea.classList.remove('loading');
        
        // Animate response appearance
        responseArea.style.opacity = '0';
        setTimeout(() => {
            responseArea.style.opacity = '1';
        }, 100);
    }

    // Achievement System
    unlockAchievement(achievementId) {
        const badge = document.querySelector(`[data-achievement="${achievementId}"]`);
        if (badge) {
            badge.classList.add('earned');
            this.showAchievementNotification(achievementId);
        }
    }

    showAchievementNotification(achievementId) {
        const notification = document.createElement('div');
        notification.className = 'achievement-notification';
        notification.innerHTML = `
            <div class="notification-icon">🏆</div>
            <div class="notification-text">
                <span class="notification-title">Thành tựu mới!</span>
                <span class="notification-desc">Bạn đã mở khóa thành tựu</span>
            </div>
        `;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.classList.add('show');
        }, 100);
        
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                document.body.removeChild(notification);
            }, 300);
        }, 3000);
    }

    // Status Bar
    startStatusBarTime() {
        const updateTime = () => {
            const now = new Date();
            const timeString = now.toLocaleTimeString('vi-VN', { 
                hour: '2-digit', 
                minute: '2-digit',
                hour12: false 
            });
            
            const timeElement = document.querySelector('.time');
            if (timeElement) {
                timeElement.textContent = timeString;
            }
        };
        
        updateTime();
        setInterval(updateTime, 1000);
    }

    // Interactive Elements
    initializeInteractivity() {
        // Add touch feedback to interactive elements
        const interactiveElements = document.querySelectorAll(
            '.tab, .module, .template-card, .primary-button, .secondary-button, .test-button, .microlesson'
        );
        
        interactiveElements.forEach(element => {
            element.addEventListener('touchstart', () => {
                element.style.transform = 'scale(0.98)';
            });
            
            element.addEventListener('touchend', () => {
                setTimeout(() => {
                    element.style.transform = 'scale(1)';
                }, 100);
            });
        });
        
        // Add swipe navigation for screens
        this.initializeSwipeNavigation();
        
        // Add tap-to-reveal functionality
        this.initializeTapToReveal();

        // Module click handlers
        const moduleActions = document.querySelectorAll('.module-action');
        moduleActions.forEach(button => {
            button.addEventListener('click', (e) => {
                e.stopPropagation();
                this.continueModule();
            });
        });

        // Template selection handlers
        const templateCards = document.querySelectorAll('.template-card');
        templateCards.forEach(card => {
            card.addEventListener('click', () => {
                const templateName = card.querySelector('.template-title').textContent;
                this.selectTemplate(templateName);
            });
        });

        // Test prompt button
        const testButton = document.querySelector('.test-button');
        if (testButton) {
            testButton.addEventListener('click', () => {
                this.testPrompt();
            });
        }

        // Progress bar animations on scroll
        this.initializeProgressAnimations();
    }
    
    // Swipe Navigation
    initializeSwipeNavigation() {
        const contentContainer = document.querySelector('.content-container');
        let startX = 0;
        let startY = 0;
        let endX = 0;
        let endY = 0;
        
        contentContainer.addEventListener('touchstart', (e) => {
            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
        });
        
        contentContainer.addEventListener('touchend', (e) => {
            endX = e.changedTouches[0].clientX;
            endY = e.changedTouches[0].clientY;
            
            const diffX = startX - endX;
            const diffY = startY - endY;
            
            // Only process horizontal swipes that are longer than vertical
            if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 50) {
                const screens = ['home', 'learning', 'practice', 'progress', 'profile'];
                const currentIndex = screens.indexOf(this.currentScreen);
                
                if (diffX > 0 && currentIndex < screens.length - 1) {
                    // Swipe left - next screen
                    this.switchScreen(screens[currentIndex + 1]);
                } else if (diffX < 0 && currentIndex > 0) {
                    // Swipe right - previous screen
                    this.switchScreen(screens[currentIndex - 1]);
                }
            }
        });
    }
    
    // Tap to Reveal
    initializeTapToReveal() {
        // Add tap-to-reveal for achievement details
        const achievements = document.querySelectorAll('.achievement');
        achievements.forEach(achievement => {
            achievement.addEventListener('click', () => {
                const details = achievement.querySelector('.achievement-details');
                if (details) {
                    details.style.display = details.style.display === 'none' ? 'block' : 'none';
                }
            });
        });
        
        // Add tap-to-reveal for module prerequisites
        const lockedModules = document.querySelectorAll('.module.locked');
        lockedModules.forEach(module => {
            module.addEventListener('click', () => {
                const requirement = module.querySelector('.unlock-requirement');
                if (requirement) {
                    requirement.style.animation = 'shake 0.5s ease-in-out';
                    setTimeout(() => {
                        requirement.style.animation = '';
                    }, 500);
                }
            });
        });
    }

    initializeProgressAnimations() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const progressBar = entry.target.querySelector('.progress-fill');
                    if (progressBar) {
                        const width = progressBar.style.width;
                        progressBar.style.width = '0%';
                        setTimeout(() => {
                            progressBar.style.width = width;
                        }, 200);
                    }
                }
            });
        });

        const moduleElements = document.querySelectorAll('.module');
        moduleElements.forEach(module => {
            observer.observe(module);
        });
    }

    animateTextInput(input) {
        const text = input.value;
        input.value = '';
        let i = 0;
        
        const typeText = () => {
            if (i < text.length) {
                input.value += text.charAt(i);
                i++;
                setTimeout(typeText, 30);
            }
        };
        
        typeText();
    }

    // Language Support
    switchLanguage(lang) {
        // This would implement language switching functionality
        // For now, the app is in Vietnamese by default
        localStorage.setItem('preferredLanguage', lang);
    }

    // Offline Support
    enableOfflineMode() {
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/sw.js')
                .then(registration => {
                    console.log('ServiceWorker đã đăng ký thành công');
                })
                .catch(error => {
                    console.log('ServiceWorker đăng ký thất bại');
                });
        }
    }

    // Data Export
    exportProgress() {
        const progressData = {
            userId: 'user123',
            completedModules: this.userProgress.completedModules,
            currentModule: this.userProgress.currentModule,
            totalTimeSpent: this.userProgress.totalTimeSpent,
            overallProgress: this.userProgress.overallProgress,
            exportDate: new Date().toISOString()
        };

        const dataStr = JSON.stringify(progressData, null, 2);
        const dataBlob = new Blob([dataStr], {type: 'application/json'});
        
        const link = document.createElement('a');
        link.href = URL.createObjectURL(dataBlob);
        link.download = 'energyai-progress.json';
        link.click();
    }
}

// Global functions for HTML onclick handlers
function switchScreen(screenId) {
    if (window.app) {
        window.app.switchScreen(screenId);
    }
}

function showMicrolessons(moduleId) {
    if (window.app) {
        window.app.showMicrolessons(moduleId);
    }
}

function startMicrolesson(lessonId) {
    if (window.app) {
        window.app.startMicrolesson(lessonId);
    }
}

// Initialize app when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.app = new EnergyAIApp();
});

// Add CSS for notifications
const notificationStyles = `
    .achievement-notification,
    .points-notification,
    .levelup-notification {
        position: fixed;
        top: 60px;
        left: 20px;
        right: 20px;
        background: rgba(0, 122, 255, 0.9);
        border-radius: 16px;
        padding: 16px;
        display: flex;
        align-items: center;
        gap: 12px;
        transform: translateY(-100px);
        opacity: 0;
        transition: all 0.3s ease;
        z-index: 1000;
        backdrop-filter: blur(20px);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .points-notification {
        background: rgba(255, 193, 7, 0.9);
    }
    
    .levelup-notification {
        background: rgba(52, 199, 89, 0.9);
    }

    .achievement-notification.show,
    .points-notification.show,
    .levelup-notification.show {
        transform: translateY(0);
        opacity: 1;
    }

    .notification-icon,
    .points-icon,
    .levelup-icon {
        font-size: 24px;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.2);
        border-radius: 8px;
    }

    .notification-text,
    .points-text,
    .levelup-text {
        flex: 1;
    }

    .notification-title,
    .points-amount,
    .levelup-title {
        display: block;
        font-size: 16px;
        font-weight: 600;
        color: #fff;
        margin-bottom: 4px;
    }

    .notification-desc,
    .points-reason,
    .levelup-desc {
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
    }

    .loading-animation {
        text-align: center;
        color: #007AFF;
        font-weight: 600;
        animation: pulse 1.5s infinite;
    }

    @keyframes pulse {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.5; }
    }
    
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-5px); }
        75% { transform: translateX(5px); }
    }
    
    @keyframes slideInFromRight {
        0% { transform: translateX(100%); opacity: 0; }
        100% { transform: translateX(0); opacity: 1; }
    }
    
    @keyframes slideInFromLeft {
        0% { transform: translateX(-100%); opacity: 0; }
        100% { transform: translateX(0); opacity: 1; }
    }
`;

// Add styles to document
const styleSheet = document.createElement('style');
styleSheet.textContent = notificationStyles;
document.head.appendChild(styleSheet);