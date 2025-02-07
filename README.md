# GetX Clean Architecture

A Flutter project demonstrating Clean Architecture using GetX and MVVM, adhering to SOLID principles.

## 📌 Overview
This project follows a structured approach to building scalable Flutter applications with GetX for state management and dependency injection. It implements Clean Architecture to separate concerns and improve maintainability.

## 🚀 Features
- **GetX for State Management**
- **MVVM Architecture**
- **Dio for API Calls**
- **Interceptor for API Authorization**
- **Caching with DioCacheInterceptor**
- **Shared Preferences for Local Storage**
- **SOLID Principles Implementation**

## 📂 Project Structure
```
lib/
│
├── common/                # Shared utilities, themes, constants
│
├── app/                  
│   ├── exceptions/        # Custom exception handling
│   ├── global_widgets/    # Reusable UI components
│   ├── middlewares/       # Route guards and middlewares
│   ├── models/            # Entity definitions (business models)
│   ├── modules/           # Feature-based segregation 
│   │   ├── auth/          
│   │   │   ├── bindings/      # Dependency bindings
│   │   │   ├── controllers/   # State management using GetX
│   │   │   ├── services/      # Business logic and use cases
│   │   │   ├── views/         # UI components
│   │   │   ├── widgets/       # Reusable widgets on module level
│   │   ├── dashboard/        
│   │   ├── root/          # Root navigation & app entry point
│   ├── providers/         # API services and data sources
│   ├── routes/            # Navigation and route management
│   ├── services/          # Global services (e.g., Auth, Storage)
│
├── main.dart              # Application entry point
```

## 🔧 Setup & Run
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/getx_clean_architecture.git
   ```
2. Navigate to the project directory:
   ```sh
   cd getx_clean_architecture
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the project:
   ```sh
   flutter run
   ```

## 📝 Article
For a detailed explanation, check out the Medium article: [Implementing Clean Architecture with GetX and MVVM in Flutter](#).

---

🔹 *Follow best practices, explore different approaches, and refine your architecture based on your project needs.*
