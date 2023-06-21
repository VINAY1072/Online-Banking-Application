import 'package:bank_app/base_screen.dart';
import 'package:bank_app/pages/login_pages/login_page.dart';
import 'package:bank_app/pages/login_pages/sign_up_email_pass_fail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => Scene()) : Get.offAll(() => Base());
  }

  Future<void> createUserWithEmailAndPass(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Base())
          : Get.to(() => Scene());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPass(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Base())
          : Get.to(() => Scene());
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
