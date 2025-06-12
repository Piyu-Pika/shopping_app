# 🛒 Shopping App

A Flutter shopping application with product listing and detail views, implementing BLoC state management.

## 🚀 Features

- Product listing with pagination
- Product detail screen
- State management using BLoC pattern
- Infinite scroll/pagination implementation (`ProductsBloc` in `lib/features/products/bloc/products_bloc.dart`)
- Error handling for API calls
- Cart management with `CartBloc` (`lib/blocs/cart/cart_bloc.dart`)
- Checkout process with payment integration
- Splash screen for app initialization
- Congratulation screen after successful checkout

## 💻 Technical Stack

- **State Management**: BLoC Pattern
- **Pagination**: Limit/offset pagination via `_limit` and `skip` parameters
- **API Handling**: Repository pattern (`ProductsRepository` in `lib/features/products/bloc/products_bloc.dart`)
- **UI Components**: Modular widgets for reusability
- **Payment Integration**: Mock payment service for checkout process

## 📂 Project Structure

```
lib/
├── blocs/
│   ├── cart/
│   │   └── cart_bloc.dart - Handles cart state and events
│   └── product/
│       └── product_bloc.dart - Handles product state and events
├── config/
│   ├── app_theme.dart - Application theme configuration
│   └── bloc_observer.dart - Global BLoC observer for debugging
├── models/
│   ├── cart_item_model.dart - Model for cart items
│   └── product_model.dart - Model for products
├── screens/
│   ├── cart_screen.dart - Cart UI
│   ├── checkout_screen.dart - Checkout process UI
│   ├── congratulation_screen.dart - Post-checkout success UI
│   ├── payment_screen.dart - Payment process UI
│   ├── product_detail_screen.dart - Product detail UI
│   ├── product_list_screen.dart - Product listing UI
│   └── splashscreen.dart - App initialization screen
├── services/
│   └── product_service.dart - Handles API calls for products
└── widgets/
    └── product_grid_widget.dart - Grid view for product listing
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

### `ProductsBloc`
- Handles initial product loading (`FetchProducts` event)
- Manages pagination (`FetchMoreProducts` event)
- Handles error states (`ProductsError`)

### `CartBloc`
- Manages cart state (`AddToCart`, `RemoveFromCart` events)
- Calculates total price and item count
- Handles checkout process (`CheckoutCart` event)

## Future Improvements

- Complete color schemes implementation in `color_schemes.dart`
- Expand product detail screen implementation in `product_detail_screen.dart`
- Add API documentation for `ProductsRepository` interface
- Implement real payment gateway integration
- Add unit and widget tests for critical features
