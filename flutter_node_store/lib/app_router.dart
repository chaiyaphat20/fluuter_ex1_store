import 'package:flutter_node_store/layout_learning/ex1.dart';
import 'package:flutter_node_store/screen/forgotpassword/forgot_password_form.dart';
import 'package:flutter_node_store/screen/forgotpassword/forgot_password_screen.dart';
import 'package:flutter_node_store/screen/login/login_screen.dart';
import 'package:flutter_node_store/screen/register/register_screen.dart';
import 'package:flutter_node_store/screen/welcome/welcome_screen.dart';

class AppRouter {
  // Router Map Key
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotPassword';
  static const String ex1 = 'ex1';

  // ignore: always_declare_return_types
  static get routes => {
    welcome: (context) => const WelcomeScreen(),
    register: (context) => const RegisterScreen(),
    forgotPassword: (context) =>
        const ForgotPasswordScreen(),
    ex1: (context) => const Ex1(),
    login: (context) => const LoginScreen(),
  };
}
