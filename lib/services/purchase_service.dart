import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

Future<void> savePurchasedItems(List items, String customerId) async {
  for (var item in items) {
    print(' บันทึก ${item.id} จำนวน ${item.quantity} ให้กับ $customerId');

    await http.post(
      Uri.parse('http://10.0.2.2:3000/record-purchase'),
      // Uri.parse(
      //   'http://172.20.10.4:3000/record-purchase',
      // ), //check ipconfig for use ipv4 and connect same internet
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'customerid': customerId,
        'productid': item.id,
        'quantity': item.quantity,
      }),
    );
  }
}

Future<List<Product>> fetchPurchasedProducts(String customerId) async {
  final res = await http.get(
    // Uri.parse('http://10.0.2.2:3000/purchases/$customerId'),
    Uri.parse(
      'http://172.20.10.4:3000/purchases/$customerId',
    ), //check ipconfig for use ipv4 and connect same internet
  );
  if (res.statusCode == 200) {
    final data = jsonDecode(res.body) as List;
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('โหลดสินค้าที่ซื้อไม่สำเร็จ');
  }
}
