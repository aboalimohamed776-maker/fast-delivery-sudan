# Fast Delivery Sudan — Day 1 Foundation

هيكل Flutter واحد بثلاثة flavors:

- `customer`: تطبيق العميل.
- `captain`: تطبيق الكابتن.
- `admin`: لوحة الإدارة على الويب.

## Firebase

الخدمات المقررة: Firestore، Phone Authentication، Storage.

1. ثبّت Flutter وFirebase CLI وFlutterFire CLI.
2. أنشئ مشروع Firebase ثم شغّل:

```bash
firebase login
flutterfire configure --project=<firebase-project-id>
firebase deploy --only firestore:rules,storage
```

3. فعّل Phone provider من Firebase Console.
4. امنح مستخدمي الإدارة custom claim باسم `admin=true`.
5. أضف المطاعم الوهمية من `firestore/restaurants.seed.json` عبر Firebase Console أو أداة seed لاحقًا.

> لا توجد مفاتيح Firebase داخل المستودع. ملف `google-services.json` و`GoogleService-Info.plist` يجب أن يبقيا محليين ومُستثنيين من Git.

## التشغيل

بعد تثبيت Flutter:

```bash
flutter pub get
flutter run -t lib/main_customer.dart
flutter run -t lib/main_captain.dart
flutter run -d chrome -t lib/main_admin.dart
```

## بنية البيانات

- `restaurants(name,image,state,delivery_fee)`
- `captains(name,phone,bankak_account,bankak_name,subscription_end,debt,is_approved)`
- `orders(to_address,fee,commission_10,phone,captain_id,status,payment_method: cash/bankak)`
- `recharge_codes(code,days,price,is_used)`

اليوم الأول لا يحتوي واجهات إنتاجية كاملة؛ توجد نقاط تشغيل وطبقة بيانات وقواعد Firebase فقط.
