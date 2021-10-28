// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Model.dart';

class NetworkRequest {
  static const String url = 'https://fakestoreapi.com/products';

  static List<Product> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Product> products =
        list.map((model) => Product.fromJson(model)).toList();
    return products;
  }

  static Future<List<Product>> fetchProducts({int page = 1}) async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Error');
    }
  }
}
