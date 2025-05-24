// services/call_api.dart
import 'package:dio/dio.dart';
import 'package:flutter_node_store/models/api/login/login_request.dart';
import 'package:flutter_node_store/models/api/login/login_response.dart';
import 'package:flutter_node_store/models/api/register/register_request.dart';
import 'package:flutter_node_store/models/api/register/register_response.dart';
import 'package:flutter_node_store/services/dio_config.dart';
import 'package:flutter_node_store/utils/handle_error.dart';
import 'package:flutter_node_store/utils/result.dart';

class LoginAPI {
  final Dio _dio = DioConfig.dio;

  // Register API
  Future<Result<RegisterResponse>> registerAPI(
    RegisterRequest data,
  ) async {
    // Check network - ใช้ helper function
    final networkCheck =
        await ApiErrorHandler.checkNetwork();
    if (networkCheck.isError) {
      return Result.error(networkCheck.errorMessage);
    }

    try {
      final response = await _dio.post(
        'auth/register',
        data: data.toJson(),
      );

      final registerResponse = RegisterResponse.fromJson(
        response.data,
      );
      return Result.success(registerResponse);
    } catch (e) {
      return ApiErrorHandler.handleError(e);
    }
  }

  // Login API
  Future<Result<LoginResponse>> loginAPI(
    LoginRequest data,
  ) async {
    // Check network - ใช้ helper function
    final networkCheck =
        await ApiErrorHandler.checkNetwork();
    if (networkCheck.isError) {
      return Result.error(networkCheck.errorMessage);
    }

    try {
      final response = await _dio.post(
        'auth/login',
        data: data.toJson(),
      );
      print("=== DEBUG: Raw response data ===");
      print(response.data);

      final loginResponse = LoginResponse.fromJson(
        response.data,
      );
      return Result.success(loginResponse);
    } catch (e) {
      return ApiErrorHandler.handleError(e);
    }
  }
}
