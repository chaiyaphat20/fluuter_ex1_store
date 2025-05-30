import 'package:flutter/material.dart';
import 'package:flutter_node_store/themes/colors.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webChild;
  final Widget mobileChild;

  const ResponsiveLayout({
    super.key,
    required this.webChild,
    required this.mobileChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          //ปิด keyboard เมื่อคลิกที่อื่นนอกจาก form
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryDark, primary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    //USING for responsive layout
                    child: LayoutBuilder(
                      builder:
                          (
                            BuildContext context,
                            BoxConstraints constraints,
                          ) {
                            //ใช้ constraints  มาเช็คว่าหน้าจอของเรามีขนาดเท่าไหร่
                            Widget childWidget =
                                mobileChild;
                            if (constraints.maxWidth >
                                800) {
                              childWidget = webChild;
                            }
                            return childWidget;
                          },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
