import 'package:flutter/material.dart';
import '../components/nav.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 168, 198, 198),
        title: Text('Contact'),
        centerTitle: false,
        elevation: 0,
      ),
      body: ContactContent(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ContactContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFF5F3E4),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('assets/images/Phone.png', width: 24, height: 24),
                SizedBox(width: 8),
                Text(
                  '063-324-5514',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/line_app.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  '@RakNam',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Image.asset('assets/images/tiktok.png', width: 24, height: 24),
                SizedBox(width: 8),
                Text(
                  'RakNamNa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'คำถามพบป่อย',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildFAQ(
              question: '   ต้องชำระเงินอย่างไร',
              answer: '   ตอบ: ชำระผ่าน QR code ของร้านนั้น',
            ),
            _buildFAQ(
              question: '   จะตรวจสอบสถานะอย่างไร?',
              answer: '   ตอบ: ทางร้านจะแจ้งสถานะการจัดส่งผ่านการ Chat',
            ),
            _buildFAQ(
              question: '   มีโปรโมชั่นมั้ย?',
              answer:
                  '   ตอบ: ที่ร้านสามารถกดไอคอนแจ้งเตือนเพื่อดูโปรโมชั่นได้',
            ),
            _buildFAQ(
              question: '   ผู้ขายต้องทำอะไรบ้าง?',
              answer: '   ตอบ: สามารถอ่านได้จากคู่มือผู้ขายในหน้า Sign in',
            ),
            _buildFAQ(
              question: '   จะเริ่มกับร้านอย่างไร?',
              answer: '   ตอบ: สามารถกดที่รูปโปรไฟล์ร้านได้เลย',
            ),
            Center(
              child: Image.asset(
                'assets/images/fish.png',
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQ({required String question, required String answer}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(answer),
        ],
      ),
    );
  }
}
