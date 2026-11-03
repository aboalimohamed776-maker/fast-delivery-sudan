# ZoolFast - Day 3

تمت إضافة إعادة العلامة إلى ZoolFast، والدول الخمس، وحفظ الدولة المختارة، ونموذجَي الدفع.

## الدول

`lib/core/constants/countries.dart` يعرّف SD وSA وEG وAE وQA مع العملة والرمز والمدن ونموذج الدفع. الاختيار الافتراضي هو السودان، وتُحفظ الدولة في SharedPreferences.

## الدفع

السودان يستخدم recharge codes مع cash/bankak. الدول الأخرى تستخدم commission 15% وMyFatoorah الاختباري. لا يتم تخزين token في Git؛ مرره عبر `--dart-define=MYFATOORAH_API_TOKEN=...`.

## Firestore additions

أضيفت حقول country وcurrency وiban وtotal_earnings وtotal_commission_paid للكباتن، وcommission_15 وcaptain_earning_85 وpayment_gateway وpayment_id للطلبات، وحقل country لكود الشحن. توجد مجموعة `countries_stats` للتقارير.

لم يتم حذف أي من ملفات Day 1 أو Day 2. بيئة Sandbox لا تحتوي Flutter SDK، لذلك يجب تشغيل `flutter pub get` و`flutter analyze` محليًا بعد تثبيت Flutter وتهيئة FlutterFire.
