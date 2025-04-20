import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review_model.dart';

Future<List<Review>> fetchReviews(String productId) async {
  final res = await http.get(
    // Uri.parse(
    //   'http://10.0.2.2:3000/reviews?productId=$productId',
    // ), //for emulator
    Uri.parse(
      'http://172.20.10.4:3000/reviews?productId=$productId',
    ), //check ipconfig for use ipv4 and connect same internet
  );

  if (res.statusCode == 200) {
    final List data = jsonDecode(res.body);
    return data.map((json) => Review.fromJson(json)).toList();
  } else {
    throw Exception("โหลดรีวิวไม่สำเร็จ");
  }
}
