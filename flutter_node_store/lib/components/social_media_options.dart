import 'package:flutter/material.dart';

class SocialMediaOptions extends StatelessWidget {
  const SocialMediaOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(child: Divider(color: Colors.black)),
              Text(" หรือเข้าสู่ระบบด้วย "),
              Expanded(child: Divider(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/google.png",
                  width: 30,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/facebook.png",
                  width: 30,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/twitter.png",
                  width: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
