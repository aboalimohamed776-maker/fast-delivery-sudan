# Flavors

Android variants are `customer`, `captain`, and `admin`.

```bash
flutter run --flavor customer -t lib/main_customer.dart
flutter run --flavor captain -t lib/main_captain.dart
flutter run --flavor admin -t lib/main_admin.dart
flutter build web -t lib/main_admin.dart
```

The admin flavor is intended for Flutter Web. iOS flavor targets are reserved for the next setup day.
