import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/components/form/custom_text_form_field.dart';
import 'package:flutter_node_store/components/rounded_button.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  // สร้าง GlobalKey สำหรับ Form นี้
  final _formKeyRegister = GlobalKey<FormState>();

  // สร้าง TextEditingController
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "ลงทะเบียน",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Form(
            key: _formKeyRegister,
            child: Column(
              children: [
                customTextFormField(
                  controller: _firstNameController,
                  hintText: "First Name",
                  prefixIcon: Icons.person,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกชื่อ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                customTextFormField(
                  controller: _lastNameController,
                  hintText: "Last Name",
                  prefixIcon: Icons.person,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกนามสกุล";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                customTextFormField(
                  controller: _emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  obscureText: false,
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
                customTextFormField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกรหัสผ่านอีกครั้ง";
                    } else if (value !=
                        _passwordController.text) {
                      return "กรุณากรอกรหัสผ่านให้ตรงกัน";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                RoundedButton(
                  label: "SIGN UP",
                  onPressed: () async {
                    // ตรวจสอบข้อมูลฟอร์ม
                    if (_formKeyRegister.currentState!
                        .validate()) {
                      // ถ้าข้อมูลถูกต้อง ให้ทำการบันทึกข้อมูล
                      _formKeyRegister.currentState!.save();

                      // แสดงข้อมูลที่บันทึกได้ทาง Console
                      // print("First Name: ${_firstNameController.text}");
                      // print("Last Name: ${_lastNameController.text}");
                      // print("Email: ${_emailController.text}");
                      // print("Password: ${_passwordController.text}");

                      // เรียกใช้งาน API สำหรับลงทะเบียน Register
                      // var response = await CallAPI().registerAPI(
                      //   {
                      //     "firstname": _firstNameController.text,
                      //     "lastname": _lastNameController.text,
                      //     "email": _emailController.text,
                      //     "password": _passwordController.text
                      //   }
                      // );

                      // var body = jsonDecode(response);

                      // logger.i(body);

                      // if(body['message'] == 'No Network Connection'){
                      //   // แจ้งเตือนว่าไม่มีการเชื่อมต่อ Internet
                      //   Utility.showAlertDialog(
                      //     context,
                      //     'แจ้งเตือน',
                      //     body['message']
                      //   );
                      // }else{
                      //   if(body['status'] == 'ok'){
                      //     // แจ้งเตือนว่าลงทะเบียนสำเร็จ
                      //     // Utility.showAlertDialog(
                      //     //   context,
                      //     //   'แจ้งเตือน',
                      //     //   body['message']
                      //     // );
                      //     // ส่งกลับไปหน้า Login
                      //     Navigator.pushReplacementNamed(context, AppRouter.login);
                      //   }else{
                      //     // แจ้งเตือนว่าลงทะเบียนไม่สำเร็จ
                      //     Utility.showAlertDialog(
                      //       context,
                      //       'แจ้งเตือน',
                      //       body['message']
                      //     );
                      //   }
                      // }
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("มีบัญชีอยู่แล้ว ? "),
              InkWell(
                onTap: () {
                  //Open Login screen here
                  Navigator.pushReplacementNamed(
                    context,
                    AppRouter.login,
                  );
                },
                child: const Text(
                  "เข้าสู่ระบบ",
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
