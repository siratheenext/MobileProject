import 'package:flutter/material.dart';
import '../components/nav.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import '../services/purchase_service.dart';

class QRPaymentPage extends StatelessWidget {
  final String customerId;

  const QRPaymentPage({Key? key, required this.customerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3E4),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 198, 198),
        title: const Text(
          'ชำระเงิน',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'โปรดชำระเงินด้วยการโอนเงินผ่านบัญชีธนาคาร',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Text(
                      'ชื่อบัญชี: นาย สิรธีร์ กลื่นบัว',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ธนาคาร: กสิกรไทย (KBank)',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'เลขที่บัญชี: 000-0-00000-0',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () async {
                  // บันทึกสินค้าเข้า purchase history
                  await savePurchasedItems(cartService.items, customerId);

                  // เคลียร์ตะกร้า
                  cartService.clearCart();

                  // แจ้งเตือน
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text("ขอบคุณค่ะ!"),
                          content: const Text(
                            "ระบบได้รับการแจ้งชำระเงินของคุณแล้ว",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/home');
                              },
                              child: const Text("กลับหน้าแรก"),
                            ),
                          ],
                        ),
                  );
                },
                icon: const Icon(Icons.check_circle),
                label: const Text("แจ้งชำระเงินแล้ว"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
