import 'package:flutter/material.dart';
import '/components/nav.dart';
import 'chat_page.dart'; // << เพิ่มอันนี้

class NotificationPage extends StatelessWidget {
  final Color cream = const Color(0xFFF5F3E4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6E1E1),
        title: const Text('แจ้งเตือน'),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/back.png', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'แชท',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ✅ แชทแบบกดได้
            _buildChatItemClickable(
              context,
              'assets/images/fish.png',
              'SonSonSea',
              'สวัสดีค่ะ วันนี้มีอะไรให้ช่วยไหมคะ',
              '10:00 A.M.',
            ),

            _buildChatItemClickable(
              context,
              'assets/images/fish.png',
              'NaNaWa',
              'สนใจสินค้าชิ้นนี้ค่ะ',
              '10:30 A.M.',
            ),

            _buildChatItemClickable(
              context,
              'assets/images/fish.png',
              'NamNoN Shop',
              'แจ้งส่งของแล้วนะคะ',
              '11:42 A.M.',
            ),

            _buildChatItemClickable(
              context,
              'assets/images/fish.png',
              'Koh Kood Shop',
              'โปรโมชั่นมีถึงเมื่อไหร่คะ',
              '12:30 A.M.',
            ),

            const SizedBox(height: 20),
            const Text(
              'โปรโมชั่น',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildPromoItem(
              'assets/images/fish.png',
              'ลด 50%',
              'วันนี้เท่านั้นจ้าาาาโลก',
              '1:00 A.M.',
            ),
            _buildPromoItem(
              'assets/images/fish.png',
              'ซื้อ 1 แถม 1',
              'ร้านปลาแสนดี',
              '05/06/2568',
            ),
            _buildPromoItem(
              'assets/images/fish.png',
              'บรรจุใส่ถุงให้ฟรี!!!',
              'ร้านปลาแสนดี',
              '08/06/2568',
            ),
            _buildPromoItem(
              'assets/images/fish.png',
              'เล่นเกมนี้ ได้โปแถมส่งฟรี',
              'รับส่วนลดผ่านเกมแสนสนุกของโลก',
              '28/06/2568',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  /// แชทที่กดแล้วไปหน้า ChatPage
  Widget _buildChatItemClickable(
    BuildContext context,
    String imagePath,
    String name,
    String message,
    String time,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatPage(chatName: name)),
        );
      },
      child: _buildChatItem(imagePath, name, message, time),
    );
  }

  /// รูปแบบแชท 1 รายการ
  Widget _buildChatItem(
    String imagePath,
    String name,
    String message,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// โปรโมชั่น 1 รายการ
  Widget _buildPromoItem(
    String imagePath,
    String title,
    String detail,
    String date,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          detail,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
