import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_store/main.dart';

class Utility {
  // Check Network Connection
  static Future<String> checkNetwork() async {
    try {
      // สำหรับ connectivity_plus version ใหม่
      List<ConnectivityResult> connectivityResults =
          await Connectivity().checkConnectivity();

      // Check ว่ามี connection หรือไม่
      if (connectivityResults.contains(
        ConnectivityResult.none,
      )) {
        return '';
      } else if (connectivityResults.contains(
        ConnectivityResult.mobile,
      )) {
        return 'mobile';
      } else if (connectivityResults.contains(
        ConnectivityResult.wifi,
      )) {
        return 'wifi';
      } else if (connectivityResults.contains(
        ConnectivityResult.ethernet,
      )) {
        return 'ethernet';
      } else if (connectivityResults.contains(
        ConnectivityResult.other,
      )) {
        //emu
        return 'other';
      }

      return '';
    } catch (e) {
      logger.e("Error checking network: $e");
      return '';
    }
  }

  // Alert Dialog
  static void showAlertDialog(context, title, content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }
}
