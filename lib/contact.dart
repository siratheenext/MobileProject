// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Color(0xFFF5F3E4),
//       ),
//       // home: _buildFAQ(),
//       home: ContactPage(), //fix
//     );
//   }
// }

// // class _buildFAQ extends StatefulWidget {
// class ContactPage extends StatefulWidget { //fix
//   @override
//   ContactPageState createState() => ContactPageState();
// }

// // class ContactPageState extends State<_buildFAQ> {
// class ContactPageState extends State<ContactPage> { //fix
//   int _selectedIndex = 0; // Track the selected index for the BottomNavigationBar

//   // List of screens to navigate
//   final List<Widget> _widgetOptions = [
//     Center(child: SingleChildScrollView(
//         child: Container(
//           color: Color(0xFFF5F3E4),
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // Contact details 
//               Row(
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/images/Phone.svg', // Replace with the correct path
//                     width: 24,
//                     height: 24,
//                   ),
//                   SizedBox(width: 8),
//                   Text('063-324-5514', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/images/line_app.svg', // Replace with the correct path
//                     width: 24,
//                     height: 24,
//                   ),
//                   SizedBox(width: 8),
//                   Text('@RakNam'),
//                   SizedBox(width: 16),
//                   Icon(
//                     Icons.tiktok,
//                     color: Colors.white, // Replace with the correct path
//                   ),
//                   SizedBox(width: 8),
//                   Text('RakNamNa'),
//                 ],
//               ),
//               SizedBox(height: 20),
              
//               // Frequently Asked Questions (FAQ)
//               Text('คำถามพบป่อย', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Row(
//                 question: '   ต้องชำระเงินอย่างไร',
//                 answer: '   ตอบ: ชำระผ่าน QR code ของร้านนั้น',
//               ),
//               _buildFAQ(
//                 question: '   จะตรวจสอบสถานะอย่างไร?',
//                 answer: '   ตอบ: ทางร้านจะแจ้งสถานะการจัดส่งผ่านการ Chat',
//               ),
//               _buildFAQ(
//                 question: '   มีโปรโมชั่นมั้ย?',
//                 answer: '   ตอบ: ที่ร้านสามารถกดไอคอนแจ้งเตือนเพื่อดูโปรโมชั่นได้',
//               ),
//               _buildFAQ(
//                 question: '   ผู้ขายต้องทำอะไรบ้าง?',
//                 answer: '   ตอบ: สามารถอ่านได้จากคู่มือผู้ขายในหน้า Sign in',
//               ),
//               _buildFAQ(
//                 question: '   จะเริ่มกับร้านอย่างไร?',
//                 answer: '   ตอบ: สามารถกดที่รูปโปรไฟล์ร้านได้เลย',
//               ),
//               Center(
//                 child: Image.asset(
//                   'assets/images/fish.png', // Replace with the correct path
//                   width: 300,
//                   height: 300,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),),
//     Center(child: Text("แจ้งเตือน")),
//     Center(child: Text("Cart Screen")),
//     Center(child: Text("Profile Screen")),
//   ];
  
//   get backgroundColor => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70), // Adjust AppBar height
//         child: AppBar(
//           backgroundColor: Color.fromARGB(255, 168, 198, 198), // AppBar color
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                 Text('Contact'),
//                 backgroundColor[ Color(0xFFC9D9D9)],
//                 ],
//               ),
//               SizedBox(height: -3),
//               Row(
//               ),
//             ],
//           ),
//           centerTitle: false,
//           elevation: 0,
//         ),
//       ),



//       body: _widgetOptions[_selectedIndex], // Show the selected screen
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//             if (_selectedIndex == 0) {
//               // When the Home icon is clicked, navigate to the Home page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             }
//           });
//         },
//         selectedItemColor: Colors.blue, // Color when selected
//         unselectedItemColor: Colors.black, // Color when not selected
//         items: [
//           BottomNavigationBarItem(
//             icon: _buildIcon('assets/images/Home.png', _selectedIndex == 0),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: _buildIcon('assets/images/mdi-light_bell.png', _selectedIndex == 1),
//             label: 'แจ้งเตือน',
//           ),
//           BottomNavigationBarItem(
//             icon: _buildIcon('assets/images/Crash.png', _selectedIndex == 2),
//             label: 'ตะกร้า',
//           ),
//           BottomNavigationBarItem(
//             icon: _buildIcon('assets/images/weui_me-filled.png', _selectedIndex == 3),
//             label: 'ฉัน',
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to build the icon in BottomNavigationBar
//   Widget _buildIcon(String asset, bool isSelected) {
//     return ColorFiltered(
//       colorFilter: ColorFilter.mode(
//         isSelected ? Colors.blue : Colors.black, // Change color based on selection
//         BlendMode.srcIn,
//       ),
//       child: Image.asset(
//         asset,
//         width: 30,
//         height: 30,
//       ),
//     );
//   }
// }

// // Create Home screen
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Text(
//           "Welcome to Home Screen!",
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Contact Page',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: ContactPage(),
// //     );
// //   }
// // }

// // class ContactPage extends StatefulWidget {
// //   @override
// //   _ContactPageState createState() => _ContactPageState();
// // }

// // class _ContactPageState extends State<ContactPage> {
// //   int _selectedIndex = 0; // Track the selected index for the BottomNavigationBar

// //   // List of Bottom Bar items
// //   List<Widget> _widgetOptions = <Widget>[
// //     HomeScreen(), // Placeholder for Home
// //     NotificationScreen(), // Placeholder for Notification
// //     CartScreen(), // Placeholder for Cart
// //     ProfileScreen(), // Placeholder for Profile
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Contact'),
// //         backgroundColor: Color(0xFFC9D9D9),
// //       ),
//       // body: SingleChildScrollView(
//       //   child: Container(
//       //     color: Color(0xFFF5F3E4),
//       //     padding: EdgeInsets.all(16.0),
//       //     child: Column(
//       //       crossAxisAlignment: CrossAxisAlignment.start,
//       //       children: <Widget>[
//       //         // Contact details 
//       //         Row(
//       //           children: <Widget>[
//       //             Image.asset(
//       //               'assets/images/Phone.svg', // Replace with the correct path
//       //               width: 24,
//       //               height: 24,
//       //             ),
//       //             SizedBox(width: 8),
//       //             Text('063-324-5514', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//       //           ],
//       //         ),
//       //         Row(
//       //           children: <Widget>[
//       //             Image.asset(
//       //               'assets/images/line_app.svg', // Replace with the correct path
//       //               width: 24,
//       //               height: 24,
//       //             ),
//       //             SizedBox(width: 8),
//       //             Text('@RakNam'),
//       //             SizedBox(width: 16),
//       //             Icon(
//       //               Icons.tiktok,
//       //               color: Colors.white, // Replace with the correct path
//       //             ),
//       //             SizedBox(width: 8),
//       //             Text('RakNamNa'),
//       //           ],
//       //         ),
//       //         SizedBox(height: 20),
              
//       //         // Frequently Asked Questions (FAQ)
//       //         Text('คำถามพบป่อย', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//       //         SizedBox(height: 10),
//       //         _buildFAQ(
//       //           question: '   ต้องชำระเงินอย่างไร',
//       //           answer: '   ตอบ: ชำระผ่าน QR code ของร้านนั้น',
//       //         ),
//       //         _buildFAQ(
//       //           question: '   จะตรวจสอบสถานะอย่างไร?',
//       //           answer: '   ตอบ: ทางร้านจะแจ้งสถานะการจัดส่งผ่านการ Chat',
//       //         ),
//       //         _buildFAQ(
//       //           question: '   มีโปรโมชั่นมั้ย?',
//       //           answer: '   ตอบ: ที่ร้านสามารถกดไอคอนแจ้งเตือนเพื่อดูโปรโมชั่นได้',
//       //         ),
//       //         _buildFAQ(
//       //           question: '   ผู้ขายต้องทำอะไรบ้าง?',
//       //           answer: '   ตอบ: สามารถอ่านได้จากคู่มือผู้ขายในหน้า Sign in',
//       //         ),
//       //         _buildFAQ(
//       //           question: '   จะเริ่มกับร้านอย่างไร?',
//       //           answer: '   ตอบ: สามารถกดที่รูปโปรไฟล์ร้านได้เลย',
//       //         ),
//       //         Center(
//       //           child: Image.asset(
//       //             'assets/images/fish.png', // Replace with the correct path
//       //             width: 300,
//       //             height: 300,
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // ),
// //       // BottomNavigationBar with custom icons
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: _selectedIndex,
// //         onTap: (index) {
// //           setState(() {
// //             _selectedIndex = index;
// //           });
// //         },
// //         selectedItemColor: Colors.blue, // Color when selected
// //         unselectedItemColor: Colors.black, // Color when not selected
// //         items: [
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/images/Home.png', // Home icon from the uploaded image
// //               width: 30,
// //               height: 30,
// //             ),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/images/mdi-light_bell.png', // Notification icon from the uploaded image
// //               width: 30,
// //               height: 30,
// //             ),
// //             label: 'แจ้งเตือน',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/images/Crash.png', // Cart icon from the uploaded image
// //               width: 30,
// //               height: 30,
// //             ),
// //             label: 'ตะกร้า',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/images/weui_me-filled.png', // Profile icon from the uploaded image
// //               width: 30,
// //               height: 30,
// //             ),
// //             label: 'ฉัน',
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildFAQ({required String question, required String answer}) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 10.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: <Widget>[
// //           Text(
// //             question,
// //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //           ),
// //           SizedBox(height: 5),
// //           Text(answer),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // Placeholder screens for BottomNavigationBar
// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Home Screen'));
// //   }
// // }

// // class NotificationScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Notification Screen'));
// //   }
// // }

// // class CartScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Cart Screen'));
// //   }
// // }

// // class ProfileScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Profile Screen'));
// //   }
// // }

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
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    ContactContent(),
    Center(child: Text("แจ้งเตือน")),
    Center(child: Text("Cart Screen")),
    Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 168, 198, 198),
        title: Text('Contact'),
        centerTitle: false,
        elevation: 0,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/Home.png', _selectedIndex == 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/mdi-light_bell.png', _selectedIndex == 1),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/Crash.png', _selectedIndex == 2),
            label: 'ตะกร้า',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/weui_me-filled.png', _selectedIndex == 3),
            label: 'ฉัน',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String asset, bool isSelected) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.blue : Colors.black,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        asset,
        width: 30,
        height: 30,
      ),
    );
  }
}

// หน้าหลักของ Contact
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
                Image.asset(
                  'assets/images/Phone.svg',
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
                  'assets/images/line_app.svg',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text('@RakNam'),
                SizedBox(width: 16),
                Icon(
                  Icons.tiktok,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                Text('RakNamNa'),
              ],
            ),
            SizedBox(height: 20),
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
