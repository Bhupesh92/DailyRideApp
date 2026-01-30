**🚗 DailyRide – Car & Bike Pooling iOS App
**
DailyRide is a native iOS application designed for car and bike pooling among known riders / trusted travelers. The app focuses on safe, efficient, and reliable ride sharing with a clean, scalable architecture. This project is built to demonstrate real-world iOS engineering practices, including Clean Architecture, MVVM, async/await, and modular feature-based design.

**📱 Features
**
Authentication
User Sign Up
User Login
Secure session handling
Ride Management
Search available rides
Post a new ride (car/bike)
View ride history (posted & joined rides)
Messaging
In-app messaging between riders and travelers
Ride-based conversations
User Profile
View & edit profile
Vehicle details
Trusted rider information

**🏗 Architecture Overview
**
The app follows Clean Architecture + MVVM, ensuring:
Clear separation of concerns
High testability
Easy scalability
Maintainable codebase


Architecture Layers
Presentation (SwiftUI + ViewModels)
        ↓
Domain (Entities + UseCases)
        ↓
Data (Repositories + APIs + DTOs)
        ↓
Core (Network, Persistence, Utilities)

**📂 Project Structure
**
The project is organized using feature-based modularization:
DailyRideApp
├── App
├── Core
├── Domain
├── Data
├── Features
│   ├── Auth
│   ├── Rides
│   ├── Messages
│   └── Profile
├── UIComponents
├── Resources
└── Tests

Each feature contains its own:
Views
ViewModels
Coordinators (navigation)
Business logic via UseCases

**🧠 Key Design Decisions
**
SwiftUI for modern declarative UI
MVVM for presentation logic
Clean Architecture for long-term scalability
Async/Await for concurrency
Repository Pattern for data abstraction
Coordinator Pattern for navigation
Dependency Injection via AppContainer

**🧪 Testing Strategy
**
The project includes:
Unit Tests
Domain UseCases
ViewModels
UI Tests
Authentication flows
Ride posting & search flows
Tests
├── DomainTests
├── ViewModelTests
└── UITests

**🌐 Networking
**

Built on top of URLSession
Centralized NetworkService
Request/response handling via DTOs
Error handling through domain-friendly errors

**🔐 Security & Privacy
**
Token-based authentication
Secure storage for sensitive data
Designed for known rider pooling to improve safety


**🚀 Getting Started
**
Requirements
Xcode 15+
iOS 16+
Swift 5.9+
Run the App
Clone the repository
git clone https://github.com/bhupesh92/DailyRide.git
Open DailyRide.xcodeproj
Select a simulator or device
Build & Run ▶️

**🔮 Future Enhancements
**
Maps & live location tracking
Ride ratings & reviews
Push notifications
Payments integration
Swift Package modularization
CI/CD with Jenkins & Fastlane

👨‍💻 Author
Bhupesh Kumar
Senior iOS Developer
Expertise in scalable iOS apps, Clean Architecture, CI/CD, OTT & real-time systems

📄 License
This project is for learning and demonstration purposes.
Feel free to fork and extend.
