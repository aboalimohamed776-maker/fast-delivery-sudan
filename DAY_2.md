# Day 2 — Captain + Admin + Live Tracking

تمت متابعة نفس مستودع Day 1 بعد رفعه إلى GitHub. بما أن الأساس الفعلي هو Flutter وليس React، تم تنفيذ Day 2 كامتداد Flutter واحد:

- Captain app: `lib/features/captain/` و `lib/main_captain.dart`.
- Admin Web dashboard: `lib/features/admin/` و `lib/main_admin.dart`.
- Realtime tracking: `lib/core/firebase/live_tracking_service.dart`.
- Firebase RTDB paths: `/orders/{orderId}/captainLocation`، `/orders/{orderId}/status`، و`/captains/{captainId}/location`.
- Branding: ZoolFast، أصفر `#FFD700` وأسود، وPort Sudan.
- لا يوجد payment gateway ولا واجهة دول متعددة.

تشغيل Flutter:

```bash
flutter pub get
flutter run -t lib/main_captain.dart
flutter run -d chrome -t lib/main_admin.dart
```

ملاحظة: Flutter SDK غير مثبت في Sandbox، لذلك لم يمكن تشغيل build فعلي هنا. كما أن طلب `npm run build` غير منطبق على الأساس الحالي لأنه Flutter وليس React. يجب تشغيل `flutter analyze` و`flutter build web -t lib/main_admin.dart` بعد إعداد Firebase وFlutterFire.
