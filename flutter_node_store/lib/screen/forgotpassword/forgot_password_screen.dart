import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/mobile_layout.dart';
import 'package:flutter_node_store/components/responsive_layout.dart';
import 'package:flutter_node_store/components/web_layout.dart';
import 'package:flutter_node_store/screen/forgotpassword/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webChild: WebLayout(
        imageWidget: Image.asset(
          "assets/images/forgot-password.png",
          width: 200,
        ),
        dataWidget:
            ForgotPasswordForm(), //Lets create widget for forgot password for & use here
      ),
      mobileChild: MobileLayout(
        imageWidget: Image.asset(
          "assets/images/forgot-password.png",
          width: 75,
        ),
        dataWidget: ForgotPasswordForm(),
      ),
    );
  }
}
