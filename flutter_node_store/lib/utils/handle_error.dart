import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_node_store/utils/result.dart';
import 'package:flutter_node_store/utils/utility.dart';

class ApiErrorHandler {
  // Check network connection
  static Future<Result<void>> checkNetwork() async {
    String networkStatus = await Utility.checkNetwork();
    if (networkStatus.isEmpty) {
      return Result.error('ไม่มีการเชื่อมต่ออินเทอร์เน็ต');
    }
    return Result.success(null);
  }

  // Handle error และ return Result
  static Result<T> handleError<T>(dynamic e) {
    if (e is DioException) {
      final data = _extractResponseData(e.response?.data);
      final message = _extractErrorMessage(data);

      if (message != null) {
        return Result.error(message);
      }

      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        return Result.error(
          _getDefaultMessageByStatus(statusCode),
        );
      }

      return Result.error(_getDefaultMessageByType(e.type));
    }

    print("Non-Dio error: $e");
    return Result.error('เกิดข้อผิดพลาดที่ไม่คาดคิด');
  }

  static dynamic _extractResponseData(dynamic rawData) {
    try {
      if (rawData is String) return jsonDecode(rawData);
      return rawData;
    } catch (_) {
      return null;
    }
  }

  static String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      for (final key in [
        'message',
        'error',
        'msg',
        'detail',
      ]) {
        final value = data[key]?.toString().trim();
        if (value != null &&
            value.isNotEmpty &&
            value != 'null') {
          return value;
        }
      }
    }
    return null;
  }

  static String _getDefaultMessageByStatus(int code) {
    switch (code) {
      case 400:
        return 'ข้อมูลไม่ถูกต้อง';
      case 401:
        return 'อีเมลหรือรหัสผ่านไม่ถูกต้อง';
      case 403:
        return 'ไม่อนุญาตให้เข้าถึง';
      case 404:
        return 'ไม่พบข้อมูลที่ต้องการ';
      case 422:
        return 'ข้อมูลไม่ครบถ้วน';
      case 500:
        return 'เซิร์ฟเวอร์เกิดข้อผิดพลาด';
      default:
        return 'เกิดข้อผิดพลาด (รหัส: $code)';
    }
  }

  static String _getDefaultMessageByType(
    DioExceptionType type,
  ) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'การเชื่อมต่อหมดเวลา';
      case DioExceptionType.connectionError:
        return 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้';
      case DioExceptionType.badResponse:
        return 'เซิร์ฟเวอร์ตอบกลับไม่ถูกต้อง';
      default:
        return 'เกิดข้อผิดพลาดจากเซิร์ฟเวอร์';
    }
  }
}
