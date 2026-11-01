# Day 1 — Foundation only

## Delivered

- Flutter single-project structure with three entrypoints/flavors: customer, captain, admin web.
- Firebase dependency layer for Core, Phone Auth, Firestore, and Storage.
- Firestore repository starter.
- Domain model skeleton for restaurants, captains, orders, and recharge codes.
- Firestore and Storage security rules.
- Three Sudanese dummy restaurants in seed JSON.
- Android product flavors.

## Intentionally not built today

- Full screens and navigation.
- Production Firebase project credentials.
- Payment integration or Bankak API.
- Admin custom-claims automation.

## Note

The current build sandbox does not include the Flutter SDK, so compilation was not run here. Run `flutter pub get` and `flutter analyze` locally after installing Flutter; then run `flutterfire configure` to generate `lib/firebase_options.dart`.
