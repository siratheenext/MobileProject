import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../models/review_model.dart';
import '../services/review_service.dart';
import '../services/cart_service.dart';
import '../models/cart_item_model.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<Review> reviews = [];

  @override
  void initState() {
    super.initState();
    loadReviews();
  }

  void loadReviews() async {
    try {
      final result = await fetchReviews(widget.product.productid);
      setState(() => reviews = result);
    } catch (e) {
      // ถ้าดึงไม่ได้จะไม่มีรีวิวแสดง
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Color(0xFFF5F3E4),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE3DC),
        title: const Text("CARDARIA", style: TextStyle(letterSpacing: 2)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/images/back.png', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(product.imageUrl, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(
            product.description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "฿${product.price.toStringAsFixed(0)}",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFECE5CE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "รายละเอียดสินค้า",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (reviews.isNotEmpty) ...[
            const Text(
              "MY REVIEW",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (var review in reviews)
              Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < review.rating
                              ? Icons.star
                              : Icons.star_border,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      review.comment,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(review.username),
                    Text(review.date),
                  ],
                ),
              ),
          ],
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final cart = Provider.of<CartService>(context, listen: false);

                  cart.addItem(
                    CartItem(
                      id: product.productid,
                      name: product.description,
                      imageUrl: product.imageUrl,
                      price: product.price,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('เพิ่มสินค้าใส่ตะกร้าเรียบร้อย')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ),
                child: Text("ใส่ตะกร้า", style: TextStyle(color: Colors.black)),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pay'); // ✅ ไปหน้าชำระเงิน
                },
                child: Text("ซื้อเลย"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
