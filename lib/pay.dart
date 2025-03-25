import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F3E4),
      ),
      home: QRPaymentPage(),
    );
  }
}

class QRPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // ปรับขนาดความสูงของ AppBar
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 168, 198, 198), // ปรับสีของ AppBar
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile_s.png'), // รูปที่คุณอัปโหลด
                  ),
                  SizedBox(width: 20),
                  Text(
                    "SonSonSea\nผู้ติดตาม 3 พัน",
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: -3),
              Row(
                children: [
                  SizedBox(width: 10),
                  Container(margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)) , 
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "ติดตาม",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 247, 245, 245),
                        fontSize: 10, // ปรับขนาดของข้อความ
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      minimumSize: Size(50, 30), // กำหนดขนาดของปุ่ม (กว้าง x สูง)
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // กำหนด padding ของปุ่ม
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: false,
          elevation: 0,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/qr_me.png', // ใช้รูป QR ที่อัปโหลด
                width: 200, 
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFC9D9D9),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'ตะกร้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'บัญชี',
          ),
        ],
      ),
    );
  }
}
