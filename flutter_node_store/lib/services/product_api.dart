import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_node_store/models/api/product/product_response.dart';
import 'package:flutter_node_store/services/dio_config.dart';
import 'package:flutter_node_store/utils/handle_error.dart';
import 'package:flutter_node_store/utils/result.dart';
import 'package:flutter_node_store/utils/utility.dart';

class ProductApi {
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  // Register API
  Future<Result<List<ProductModel>>> getAllProduct() async {
    // Check network - ใช้ helper function
    final networkCheck =
        await ApiErrorHandler.checkNetwork();
    if (networkCheck.isError) {
      return Result.error(networkCheck.errorMessage);
    }

    try {
      final response = await _dioWithAuth.get('products');
      final productResponse = productModelFromJson(
        json.encode(response.data),
      );
      return Result.success(productResponse);
    } catch (e) {
      return ApiErrorHandler.handleError(e);
    }
  }
}
