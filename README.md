# ZoolFast - Day 3

ZoolFast هو مشروع Flutter واحد بثلاثة flavors: customer، captain، وadmin web. Day 3 يضيف إعادة العلامة، الدول الخمس، حفظ الدولة، نموذج أكواد السودان، نموذج عمولة الخليج 15%، ومصنع الدفع مع MyFatoorah الاختباري.

الدول المدعومة: السودان SDG، السعودية SAR، مصر EGP، الإمارات AED، وقطر QAR. السودان يستخدم أكواد الشحن والكاش/بنكك، بينما الدول الأخرى تستخدم عمولة 15% والدفع عبر MyFatoorah.

## التشغيل

```bash
flutter pub get
flutter run -t lib/main_customer.dart
flutter run -t lib/main_captain.dart
flutter run -d chrome -t lib/main_admin.dart
```

لتجربة MyFatoorah دون تخزين المفتاح في Git:

```bash
flutter run -t lib/main_customer.dart --dart-define=MYFATOORAH_API_TOKEN=<test-token>
```

لا تضع `google-services.json` أو `GoogleService-Info.plist` أو أي token داخل المستودع.
