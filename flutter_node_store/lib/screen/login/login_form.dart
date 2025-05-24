import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/components/form/custom_text_form_field.dart';
import 'package:flutter_node_store/components/rounded_button.dart';
import 'package:flutter_node_store/components/social_media_options.dart';
import 'package:flutter_node_store/models/api/login/login_request.dart';
import 'package:flutter_node_store/services/login_api.dart';
import 'package:flutter_node_store/utils/utility.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKeyLogin = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    if (!_formKeyLogin.currentState!.validate()) return;

    var body = LoginRequest(
      email: _emailController.text,
      password: _passwordController.text,
    );

    var result = await LoginAPI().loginAPI(body);
    print(result.errorMessage);
    if (result.isSuccess) {
      final response = result.data!;
      Utility.logger.e("response");

      if (response.status == 'ok') {
        await Utility.showAlertDialog(
          context,
          'สำเร็จ',
          'Login สำเร็จ!',
        );
        // Navigator.pushReplacementNamed(
        //   context,
        //   AppRouter.login,
        // );
      } else {
        Utility.showAlertDialog(
          context,
          'แจ้งเตือน',
          response.message,
        );
      }
    } else {
      Utility.showAlertDialog(
        context,
        'แจ้งเตือน',
        result.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Form(
            key: _formKeyLogin,
            child: Column(
              children: [
                customTextFormField(
                  obscureText: false,
                  controller: _emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกอีเมล";
                    } else if (!value.contains("@")) {
                      return "กรุณากรอกอีเมลให้ถูกต้อง";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                customTextFormField(
                  controller: _passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกรหัสผ่าน";
                    } else if (value.length < 6) {
                      return "กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // Forgot password
                        Navigator.pushNamed(
                          context,
                          AppRouter.forgotPassword,
                        );
                      },
                      child: const Text("ลืมรหัสผ่าน ?"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RoundedButton(
                  label: "LOGIN",
                  onPressed: () => _handleLogin(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SocialMediaOptions(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("ยังไม่มีบัญชีกับเรา ? "),
              InkWell(
                onTap: () {
                  // Signup
                  Navigator.pushReplacementNamed(
                    context,
                    AppRouter.register,
                  );
                },
                child: const Text(
                  "สมัครสมาชิก",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
