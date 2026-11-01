import 'package:firebase_core/firebase_core.dart';

class FirebaseBootstrap {
  static Future<void> initialize() async {
    // Replace this with generated DefaultFirebaseOptions after running:
    // flutterfire configure --project=<your-firebase-project-id>
    await Firebase.initializeApp();
  }
}
