import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../shared/shared.dart';

@LazySingleton()
class FirebaseHelper {
  static Future<void> init() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Log.d('User is currently signed out!');
      } else {
        Log.d('User is signed in!');
      }
    });
  }
}
