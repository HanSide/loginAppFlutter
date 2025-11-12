import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:latihan111pplg2/config/apiconfig.dart';
import 'package:latihan111pplg2/model/login_api_model.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Rxn<User> firebaseUser = Rxn<User>();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  var lastMessage = "Waiting for messages...".obs;
  var token = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initFCM();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> _initFCM() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    token.value = await _messaging.getToken() ?? "No token";
    print("📱 Token: ${token.value}");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📨 Foreground: ${message.notification?.title}");
      lastMessage.value =
          "${message.notification?.title ?? 'No title'}\n${message.notification?.body ?? 'No body'}";
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 Opened from background");
      lastMessage.value =
          "Opened: ${message.notification?.title ?? 'No title'}";
    });
  }

  Future<void> signUpWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password tidak boleh kosong');
      return;
    }

    if (password.length < 6) {
      Get.snackbar('Error', 'Password minimal 6 karakter');
      return;
    }

    isLoading.value = true;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('firebase_uid', userCredential.user?.uid ?? '');
      await prefs.setString('user_email', email);

      Get.snackbar('Sukses', 'Akun berhasil dibuat!');
      Get.offAllNamed(AppRoutes.drawerNavPage);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Terjadi kesalahan';

      switch (e.code) {
        case 'weak-password':
          errorMessage = 'Password terlalu lemah';
          break;
        case 'email-already-in-use':
          errorMessage = 'Email sudah digunakan';
          break;
        case 'invalid-email':
          errorMessage = 'Email tidak valid';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password authentication tidak diaktifkan';
          break;
        default:
          errorMessage = e.message ?? 'Terjadi kesalahan';
      }

      Get.snackbar('Error', errorMessage);
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password tidak boleh kosong');
      return;
    }

    isLoading.value = true;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('firebase_uid', userCredential.user?.uid ?? '');
      await prefs.setString('user_email', email);

      Get.snackbar('Sukses', 'Login berhasil!');
      Get.offAllNamed(AppRoutes.drawerNavPage);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Terjadi kesalahan';

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'User tidak ditemukan';
          break;
        case 'wrong-password':
          errorMessage = 'Password salah';
          break;
        case 'invalid-email':
          errorMessage = 'Email tidak valid';
          break;
        case 'user-disabled':
          errorMessage = 'Akun telah dinonaktifkan';
          break;
        case 'invalid-credential':
          errorMessage = 'Email atau password salah';
          break;
        default:
          errorMessage = e.message ?? 'Terjadi kesalahan';
      }

      Get.snackbar('Error', errorMessage);
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('firebase_uid', userCredential.user?.uid ?? '');
      await prefs.setString('user_email', userCredential.user?.email ?? '');
      await prefs.setString(
        'user_name',
        userCredential.user?.displayName ?? '',
      );
      await prefs.setString('user_photo', userCredential.user?.photoURL ?? '');

      Get.snackbar('Sukses', 'Login dengan Google berhasil!');
      Get.offAllNamed(AppRoutes.drawerNavPage);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', 'Firebase Error: ${e.message}');
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Get.offAllNamed(AppRoutes.drawerNavPage);
      Get.snackbar('Sukses', 'Logout berhasil');
    } catch (e) {
      Get.snackbar('Error', 'Gagal logout: $e');
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
