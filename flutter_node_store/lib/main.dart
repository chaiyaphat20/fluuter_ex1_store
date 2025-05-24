import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables
var initialRoute;

void main() async {
  // ต้องเรียกใช้ WidgetsFlutterBinding.ensureInitialized()
  // เพื่อให้สามารถเรียกใช้ SharedPreferences ได้
  WidgetsFlutterBinding.ensureInitialized();

  // สร้างตัวแปร pref เพื่อเรียกใช้ SharedPreferences
  SharedPreferences pref =
      await SharedPreferences.getInstance();

  // ตรวจสอบว่าเคยแสดง Intro แล้วหรือยัง
  if (pref.getBool('welcomeStatus') == true) {
    // ถ้าเคยแสดง Intro แล้ว ให้ไปยังหน้า Login
    initialRoute = AppRouter.login;
  } else {
    // ถ้ายังไม่เคยแสดง Intro ให้ไปยังหน้า Welcome
    initialRoute = AppRouter.welcome;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      routes: AppRouter.routes,
    );
  }
}
