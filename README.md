# 🛒 Shopping App

A Flutter shopping application with product listing and detail views, implementing BLoC state management.

## 🚀 Features

- Product listing with pagination
- Product detail screen
- State management using BLoC pattern
- Infinite scroll/pagination implementation (`ProductsBloc` in `lib/features/products/bloc/products_bloc.dart`)
- Error handling for API calls
- 📃 Product listing with pagination
- 🔍 Product detail screen
- 🎛️ State management using BLoC pattern
- ⏬ Infinite scroll/pagination implementation (`ProductsBloc` in `lib/features/products/bloc/products_bloc.dart`)
- ❌ Error handling for API calls

## 💻 Technical Stack

- **State Management**: BLoC Pattern
- **Pagination**: Limit/offset pagination via `_limit` and `skip` parameters
- **API Handling**: Repository pattern (`ProductsRepository` in `lib/features/products/bloc/products_bloc.dart`)
- **State Management**: 🧱 BLoC Pattern
- **Pagination**: 📊 Limit/offset pagination via `_limit` and `skip` parameters
- **API Handling**: 📦 Repository pattern (`ProductsRepository` in `lib/features/products/bloc/products_bloc.dart`)

## 📂 Project Structure

```
lib/
├── core/
│   └── themes/
│       └── color_schemes.dart - TODO: App color schemes
├── features/
│   └── products/
│       └── bloc/
│           └── products_bloc.dart - Core product listing logic
└── screens/
    └── product_detail_screen.dart - Product detail UI (WIP)
```

## Getting Started

1. Install Flutter dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Sample video 

https://github.com/user-attachments/assets/e7871f90-77ca-4a66-b86e-45eb33ad0d44



## State Management Flow

`ProductsBloc` handles:
- Initial product loading (`FetchProducts` event)
- Pagination (`FetchMoreProducts` event)
- Error states (`ProductsError`)

## Future Improvements

- Complete color schemes implementation in `color_schemes.dart`
- Expand product detail screen implementation in `product_detail_screen.dart`
- Add API documentation for `ProductsRepository` interface
