import 'package:dio/dio.dart';
import 'package:flutter_node_store/main.dart';
import 'package:flutter_node_store/models/api/register/register_request.dart';
import 'package:flutter_node_store/models/api/register/register_response.dart';
import 'package:flutter_node_store/services/dio_config.dart';
import 'package:flutter_node_store/utils/utility.dart';

class CallAPI {
  // สร้าง Dio Instance
  final Dio _dio = DioConfig.dio;

  // Register API
  Future<RegisterResponse> registerAPI(
    RegisterRequest data,
  ) async {
    // Check Network Connection
    String networkStatus = await Utility.checkNetwork();
    if (networkStatus == '' || networkStatus.isEmpty) {
      Utility.logger.w('No Network Connection');

      // Return RegisterResponse สำหรับ network error
      return RegisterResponse(
        status: 'error',
        message: 'No Network Connection',
        token: '',
      );
    } else {
      try {
        final response = await _dio.post(
          'auth/register',
          data: data.toJson(),
        );

        Utility.logger.d(
          'Register API Response: ${response.data}',
        );

        // แปลง response เป็น RegisterResponse
        final registerResponse = RegisterResponse.fromJson(
          response.data,
        );
        return registerResponse;
      } catch (e) {
        Utility.logger.e('Register API Error: $e');

        String errorMessage =
            'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง';

        if (e is DioException) {
          Utility.logger.e(
            'DioException: ${e.response?.data}',
          );

          if (e.response != null) {
            // ถ้า server ส่ง error message มา
            try {
              final errorData = e.response?.data;
              if (errorData is Map<String, dynamic> &&
                  errorData['message'] != null) {
                errorMessage = errorData['message'];
              }
            } catch (parseError) {
              Utility.logger.e(
                'Error parsing error response: $parseError',
              );
            }
          } else {
            errorMessage =
                'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้';
          }
        }

        // Return RegisterResponse สำหรับ API error
        return RegisterResponse(
          status: 'error',
          message: errorMessage,
          token: '',
        );
      }
    }
  }

  //login
  Future<RegisterResponse> loginAPI(
    RegisterRequest data,
  ) async {
    // Check Network Connection
    String networkStatus = await Utility.checkNetwork();
    if (networkStatus == '' || networkStatus.isEmpty) {
      Utility.logger.w('No Network Connection');

      // Return RegisterResponse สำหรับ network error
      return RegisterResponse(
        status: 'error',
        message: 'No Network Connection',
        token: '',
      );
    } else {
      try {
        final response = await _dio.post(
          'auth/register',
          data: data.toJson(),
        );
        final registerResponse = RegisterResponse.fromJson(
          response.data,
        );
        return registerResponse;
      } catch (e) {
        String errorMessage =
            'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง';
        if (e is DioException) {
          if (e.response != null) {
            try {
              final errorData = e.response?.data;
              if (errorData is Map<String, dynamic> &&
                  errorData['message'] != null) {
                errorMessage = errorData['message'];
              }
            } catch (parseError) {
              Utility.logger.e(
                'Error parsing error response: $parseError',
              );
            }
          } else {
            errorMessage =
                'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้';
          }
        }
        return RegisterResponse(
          status: 'error',
          message: errorMessage,
          token: '',
        );
      }
    }
  }
}
