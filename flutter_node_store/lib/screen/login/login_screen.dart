import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/mobile_layout.dart';
import 'package:flutter_node_store/components/responsive_layout.dart';
import 'package:flutter_node_store/components/web_layout.dart';
import 'package:flutter_node_store/screen/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webChild: WebLayout(
        imageWidget: Image.asset(
          "assets/images/login.png",
          width: 200,
        ),
        dataWidget: LoginForm(),
      ),
      mobileChild: MobileLayout(
        imageWidget: Image.asset(
          "assets/images/login.png",
          width: 75,
        ),
        dataWidget: LoginForm(),
      ),
    );
  }
}
