import 'package:flutter_node_store/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_node_store/screen/drawerpage/about_screen.dart';
import 'package:flutter_node_store/screen/drawerpage/contract_screen.dart';
import 'package:flutter_node_store/screen/drawerpage/info_screen.dart';
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
  static const String dashboard = 'dashboard';

  //drawer
  static const String info = 'info';
  static const String about = 'about';
  static const String contact = 'contact';

  // ignore: always_declare_return_types
  static get routes => {
    welcome: (context) => const WelcomeScreen(),
    register: (context) => const RegisterScreen(),
    forgotPassword: (context) =>
        const ForgotPasswordScreen(),
    login: (context) => const LoginScreen(),
    dashboard: (context) => const DashboardScreen(),
    info: (context) => const InfoScreen(),
    about: (context) => const AboutScreen(),
    contact: (context) => const ContractScreen(),
  };
}
