import 'package:flutter/material.dart';
import 'package:flutter_node_store/themes/styles.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("หน้าหลัก"),
        ),
        body: const Center(
          child: Text("สวัสดีชาวโลก"),
        ),
      ),
    ),
  );
}
