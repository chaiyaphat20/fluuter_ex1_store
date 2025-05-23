import 'package:flutter_node_store/screen/login/login_screen.dart';
import 'package:flutter_node_store/screen/welcome/welcome_screen.dart';

class AppRouter {
  // Router Map Key
  static const String welcome = 'welcome';
  static const String login = 'login';

  // ignore: always_declare_return_types
  static get routes => {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
  };
}
