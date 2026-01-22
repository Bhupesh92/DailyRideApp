# DailyRideApp
This is a production-ready, scalable app for your car/bike pooling iOS app, based on Clean Architecture + MVVM + Feature Modules. This is something you can directly mirror in Xcode for folder structure reference as well.

DailyRideApp
│
├── App
│   ├── DailyRideApp.swift
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── AppCoordinator.swift
│   └── AppContainer.swift
│
├── Core
│   ├── Network
│   │   ├── NetworkService.swift
│   │   ├── URLSessionNetworkService.swift
│   │   ├── APIEndpoint.swift
│   │   └── APIError.swift
│   │
│   ├── Persistence
│   │   ├── CoreDataStack.swift
│   │   ├── LocalCache.swift
│   │   └── SecureStorage.swift
│   │
│   ├── Location
│   │   ├── LocationManager.swift
│   │   └── LocationPermissionHandler.swift
│   │
│   ├── Auth
│   │   ├── AuthTokenProvider.swift
│   │   └── AuthInterceptor.swift
│   │
│   ├── Utils
│   │   ├── DateFormatter+Ext.swift
│   │   ├── String+Ext.swift
│   │   ├── Logger.swift
│   │   └── Validators.swift
│   │
│   └── Constants
│       ├── AppConstants.swift
│       └── APIConstants.swift
│
├── Domain
│   ├── Entities
│   │   ├── User.swift
│   │   ├── Ride.swift
│   │   ├── Message.swift
│   │   └── Vehicle.swift
│   │
│   ├── UseCases
│   │   ├── Auth
│   │   │   ├── LoginUseCase.swift
│   │   │   ├── SignUpUseCase.swift
│   │   │   └── LogoutUseCase.swift
│   │   │
│   │   ├── Rides
│   │   │   ├── SearchRidesUseCase.swift
│   │   │   ├── PostRideUseCase.swift
│   │   │   └── RideHistoryUseCase.swift
│   │   │
│   │   ├── Messages
│   │   │   ├── SendMessageUseCase.swift
│   │   │   └── ListenMessagesUseCase.swift
│   │   │
│   │   └── Profile
│   │       ├── FetchProfileUseCase.swift
│   │       └── UpdateProfileUseCase.swift
│   │
│   └── Repositories
│       ├── AuthRepository.swift
│       ├── RideRepository.swift
│       ├── MessageRepository.swift
│       └── ProfileRepository.swift
│
├── Data
│   ├── Repositories
│   │   ├── AuthRepositoryImpl.swift
│   │   ├── RideRepositoryImpl.swift
│   │   ├── MessageRepositoryImpl.swift
│   │   └── ProfileRepositoryImpl.swift
│   │
│   ├── DataSources
│   │   ├── Remote
│   │   │   ├── AuthAPI.swift
│   │   │   ├── RideAPI.swift
│   │   │   ├── MessageAPI.swift
│   │   │   └── ProfileAPI.swift
│   │   │
│   │   └── Local
│   │       ├── RideLocalDataSource.swift
│   │       └── UserLocalDataSource.swift
│   │
│   └── DTOs
│       ├── UserDTO.swift
│       ├── RideDTO.swift
│       └── MessageDTO.swift
│
├── Features
│   ├── Auth
│   │   ├── Login
│   │   │   ├── LoginView.swift
│   │   │   ├── LoginViewModel.swift
│   │   │   └── LoginCoordinator.swift
│   │   │
│   │   └── SignUp
│   │       ├── SignUpView.swift
│   │       ├── SignUpViewModel.swift
│   │       └── SignUpCoordinator.swift
│   │
│   ├── Rides
│   │   ├── SearchRides
│   │   │   ├── SearchRidesView.swift
│   │   │   ├── SearchRidesViewModel.swift
│   │   │   └── SearchRidesCoordinator.swift
│   │   │
│   │   ├── PostRide
│   │   │   ├── PostRideView.swift
│   │   │   ├── PostRideViewModel.swift
│   │   │   └── PostRideCoordinator.swift
│   │   │
│   │   └── RideHistory
│   │       ├── RideHistoryView.swift
│   │       ├── RideHistoryViewModel.swift
│   │       └── RideHistoryCoordinator.swift
│   │
│   ├── Messages
│   │   ├── MessagesListView.swift
│   │   ├── MessagesViewModel.swift
│   │   ├── ChatView.swift
│   │   └── ChatViewModel.swift
│   │
│   └── Profile
│       ├── ProfileView.swift
│       ├── ProfileViewModel.swift
│       ├── EditProfileView.swift
│       └── EditProfileViewModel.swift
│
├── UIComponents
│   ├── Buttons
│   │   └── PrimaryButton.swift
│   │
│   ├── TextFields
│   │   └── AppTextField.swift
│   │
│   ├── Loaders
│   │   └── LoadingView.swift
│   │
│   └── Alerts
│       └── AppAlert.swift
│
├── Resources
│   ├── Assets.xcassets
│   ├── Localizable.strings
│   └── Info.plist
│
├── SupportingFiles
│   ├── PreviewMocks
│   │   ├── MockUsers.swift
│   │   └── MockRides.swift
│   │
│   └── AppEnvironment.swift
│
└── Tests
    ├── DomainTests
    │   ├── LoginUseCaseTests.swift
    │   └── SearchRidesUseCaseTests.swift
    │
    ├── ViewModelTests
    │   ├── LoginViewModelTests.swift
    │   └── SearchRidesViewModelTests.swift
    │
    └── UITests
        ├── LoginFlowUITests.swift
        └── PostRideFlowUITests.swift
