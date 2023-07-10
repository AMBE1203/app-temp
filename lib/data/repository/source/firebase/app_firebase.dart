import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

@LazySingleton()
class AppFirebase {
  AppFirebase();

  Future<DataResponse<AuthResponseData>> loginWithEmail({required String email, required String password}) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        final user = AuthResponseData(
          uid: result.user?.uid,
          email: result.user?.email,
          displayName: result.user?.displayName,
          phoneNumber: result.user?.phoneNumber,
          refreshToken: result.user?.refreshToken,
        );
        return DataResponse(data: user);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Log.e('Wrong password provided for that user.');
      }
    } catch (e) {
      Log.e('loginWithEmail: $e');
    }
    return DataResponse();
  }
}
