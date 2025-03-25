import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        backgroundColor: Color(0xFFC9D9D9),
      ),
      body: Container(
        color: Color(0xFFF5F3E4),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Contact details 
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Phone.svg', // Replace with the correct path
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text('063-324-5514', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/line_app.svg', // Replace with the correct path
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text('@RakNam'),
                SizedBox(width: 16),
                Icon(
                  Icons.tiktok,
                  color: Colors.white, // Replace with the correct pat
                ),
                SizedBox(width: 8),
                Text('RakNamNa'),
              ],
            ),
            SizedBox(height: 20),
            
            // Frequently Asked Questions (FAQ)
            Text('คำถามพบป่อย', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
              answer: '   ตอบ: ที่ร้านสามารถกดไอคอนแจ้งเตือนเพื่อดูโปรโมชั่นได้',
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
                'assets/images/fish.png', // Replace with the correct path
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
