import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/products'));
  // final response = await http.get(
  //   Uri.parse('http://172.20.10.4:3000/products'),
  // ); //check ipconfig for use ipv4 and connect same internet

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('โหลดข้อมูลไม่สำเร็จ');
  }
}
