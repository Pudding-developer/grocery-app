# Grocery App

A Flutter application for managing grocery products. Built with clean architecture, BLoC state management, and Hive local storage.

## Features

- Browse a catalog of grocery products
- Add, edit, and delete products
- View full product details (price, stock, category, organic status)
- Category-specific icons throughout the app (product list and detail screen)
- Auto-scroll to the latest added product for quick access
- Products sorted chronologically — seeded items first, newly added items at the bottom
- Data persists locally via Hive

## Architecture

Follows **Clean Architecture** with three layers:

```
lib/
├── main.dart
├── core/
│   ├── service/
│   │   └── service_locator.dart       # get_it dependency injection
│   └── router.dart                    # GoRouter configuration
├── domain/
│   ├── entities/
│   │   └── grocery_product.dart       # Core entity
│   ├── repositories/
│   │   └── grocery_repository.dart    # Abstract repository
│   └── usecases/
│       ├── get_all_products.dart
│       ├── add_product.dart
│       ├── update_product.dart
│       └── delete_product.dart
├── data/
│   ├── models/
│   │   ├── grocery_product_model.dart # Hive model (@HiveType)
│   │   └── grocery_product_model.g.dart
│   ├── datasources/
│   │   └── grocery_local_datasource.dart
│   └── repositories/
│       └── grocery_repository_impl.dart
└── presentation/
    ├── bloc/
    │   ├── grocery_bloc.dart
    │   ├── grocery_event.dart
    │   └── grocery_state.dart
    ├── components/
    │   └── product_card.dart
    └── screens/
        ├── home/
        │   └── home_screen.dart
        └── products/
            ├── products_list_screen.dart
            ├── product_detail_screen.dart
            └── add_edit_product_screen.dart
```

## State Management

Uses `flutter_bloc` with four states:

| State | Description |
|-------|-------------|
| `GroceryInitial` | App just started |
| `GroceryLoading` | Async operation in progress |
| `GroceryLoaded` | Products loaded successfully |
| `GroceryError` | Operation failed |

## Getting Started

### Prerequisites

- Flutter SDK (Dart ^3.11.0)
- Android Studio / Xcode or a connected device

### Installation

```bash
git clone https://github.com/Pudding-developer/grocery-app.git
cd groceryapp

flutter pub get

# Generate Hive adapters
dart run build_runner build

flutter run
```

## Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | BLoC state management |
| `hive_flutter` | Local data persistence |
| `get_it` | Dependency injection |
| `go_router` | Declarative routing |
| `equatable` | Value equality |
| `intl` | Number/date formatting |

### Dev Dependencies

| Package | Purpose |
|---------|---------|
| `hive_generator` | Generates Hive type adapters |
| `build_runner` | Code generation runner |
| `flutter_lints` | Lint rules |
| `flutter_launcher_icons` | App icon generation |

## License

This project is for educational use.
