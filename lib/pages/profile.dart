import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/nav.dart';
import '../models/product_model.dart';
import '../services/purchase_service.dart';

class ProfilePage extends StatefulWidget {
  final String customerid;

  const ProfilePage({Key? key, required this.customerid}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Product> purchasedProducts = [];
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    loadPurchasedProducts();
  }

  Future<void> loadPurchasedProducts() async {
    try {
      final products = await fetchPurchasedProducts(widget.customerid);
      setState(() {
        purchasedProducts = products;
      });
    } catch (e) {
      print("เกิดข้อผิดพลาดในการโหลดข้อมูล: $e");
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showProfileInfo() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'ข้อมูลโปรไฟล์',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      _profileImage != null
                          ? FileImage(_profileImage!)
                          : const AssetImage('assets/images/bg_home.png')
                              as ImageProvider,
                ),
                const SizedBox(height: 16),
                Text(
                  'Customer ID: ${widget.customerid}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ชื่อผู้ใช้: (คุณสามารถแสดงชื่อจริงได้ที่นี่)',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6E1E1),
        leading: IconButton(
          icon: Image.asset('assets/images/back.png', width: 24, height: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          children: [
            Text(
              'MyProfile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'i do love to Sea U so much.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () {
                _showProfileInfo(); // แสดงข้อมูลโปรไฟล์
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage('assets/images/bg_home.png')
                                as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        _pickImage(); // เปลี่ยนรูปโปรไฟล์
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'แก้ไขโปรไฟล์',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  'เคยซื้อ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Container(
                  width: 140,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, size: 18),
                      SizedBox(width: 4),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child:
                purchasedProducts.isEmpty
                    ? const Center(
                      child: Text(
                        'ยังไม่มีรายการสินค้า',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: purchasedProducts.length,
                      itemBuilder: (context, index) {
                        final item = purchasedProducts[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Image.asset(
                              item.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(item.description),
                            subtitle: Text('${item.price} บาท'),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
