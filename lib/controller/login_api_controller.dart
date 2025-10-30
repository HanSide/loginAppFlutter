import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan111pplg2/config/apiconfig.dart';
import 'package:latihan111pplg2/model/login_api_model.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;


 final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  var lastMessage = "Waiting for messages...".obs;
  var token = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initFCM();
  }

  Future<void> _initFCM() async {
    // Request permission
    NotificationSettings settings = await _messaging.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    // Get token
    token.value = await _messaging.getToken() ?? "No token";
    print("📱 Token: ${token.value}");

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📨 Foreground: ${message.notification?.title}");
      lastMessage.value =
          "${message.notification?.title ?? 'No title'}\n${message.notification?.body ?? 'No body'}";
    });

    // When opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 Opened from background");
      lastMessage.value =
          "Opened: ${message.notification?.title ?? 'No title'}";
    });
  }
  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username dan password tidak boleh kosong');
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.login),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final loginModel = loginModelFromJson(response.body);

        if (loginModel.status) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', loginModel.token ?? '');

          Get.snackbar('Sukses', loginModel.message, );
          Get.offAllNamed(AppRoutes.drawerNavPage);
        } else {
          Get.snackbar('Gagal', loginModel.message);
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
