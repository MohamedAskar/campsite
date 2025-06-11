# Campsite
A scalable campsite platform for hosts and guests built with Flutter.

## 🎬 Demo

<div align="center">

#### Mobile
https://github.com/user-attachments/assets/ab2b3800-2905-4c04-bfee-d2b8a9fcf98c

### Tablets
https://github.com/user-attachments/assets/09d00ace-8c4c-41de-bf37-3a6b346e3c0e

### Web
https://github.com/user-attachments/assets/5f92bb74-40dd-41ae-b24d-96bf6860c5c7

</div>

## Features

### 🗺️ Interactive Map
- Real-time campsite locations with clustering
- Zoom controls and gesture navigation
- Custom markers for each campsite

### 🔍 Advanced Filtering
- Price range filtering
- Amenity filters (water access, campfire allowed)
- Host language preferences
- Suitability categories (families, couples, etc.)

### 📱 Responsive Design
- Optimized mobile layout with draggable bottom sheet
- Desktop layout with side panels
- Adaptive UI components

### 🎨 Modern UI
- Material 3 design system
- Dark/Light theme support
- Smooth animations and transitions

## Architecture

This project follows **Clean Architecture** principles:

```
lib/
├── core/           # Shared utilities, constants, network
├── data/           # Data sources, models, repositories
├── domain/         # Entities, use cases, repository interfaces
└── presentation/   # UI, controllers, state management
```

### Tech Stack
- **Flutter** - UI framework
- **Riverpod** - State management with code generation
- **Go Router** - Navigation
- **Freezed** - Immutable data classes
- **Dio** - HTTP client
- **Flutter Map** - Interactive maps

## Getting Started

### Prerequisites
- Flutter SDK 3.8.1+
- Dart SDK

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd campsite
```

2. Get dependencies
```bash
flutter pub get
```

3. Generate code
```bash
flutter packages pub run build_runner build
```

4. Run the app
```bash
flutter run
```

### Testing
```bash
flutter test
```

### Code Generation
When modifying Freezed classes or Riverpod providers:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Project Structure

### Domain Layer
- **Entities**: Core business objects (`Campsite`, `GeoLocation`, `CampsiteFilter`)
- **Use Cases**: Business logic (`GetCampsites`, `GetCampsiteDetails`)
- **Repositories**: Abstract data access interfaces

### Data Layer
- **Models**: JSON serializable data classes
- **Data Sources**: API integration
- **Repository Implementations**: Concrete data access

### Presentation Layer
- **Pages**: Screen widgets organized by feature
- **Controllers**: Riverpod state management
- **Providers**: Dependency injection and data providers

## API Integration

The app connects to a mock API at:
```
https://62ed0389a785760e67622eb2.mockapi.io/spots/v1/
```

### Endpoints
- `GET /campsites` - List all campsites
- `GET /campsites/{id}` - Get campsite details

## Contributing

1. Follow the existing code structure and patterns
2. Run `flutter analyze` to ensure code quality
3. Add tests for new features
4. Update documentation as needed

## License

This project is for demonstration purposes.
