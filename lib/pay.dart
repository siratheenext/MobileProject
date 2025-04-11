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

class QRPaymentPage extends StatefulWidget {
  @override
  _QRPaymentPageState createState() => _QRPaymentPageState();
}

class _QRPaymentPageState extends State<QRPaymentPage> {
  int _selectedIndex = 0; // Track the selected index for the BottomNavigationBar

  // List of screens to navigate
  final List<Widget> _widgetOptions = [
    Center(child: Center(
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
                'assets/images/qr_me.png', // Replace with your uploaded QR image
                width: 200, 
              ),
            ],
          ),
        ),
      ),),
    Center(child: Text("แจ้งเตือน")),
    Center(child: Text("Cart Screen")),
    Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // Adjust AppBar height
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 168, 198, 198), // AppBar color
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile_s.png'), // Replace with your uploaded image
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "ติดตาม",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 247, 245, 245),
                        fontSize: 10, // Adjust font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      minimumSize: Size(50, 30), // Set the button size (width x height)
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Set padding
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
      body: _widgetOptions[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 0) {
              // When the Home icon is clicked, navigate to the Home page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          });
        },
        selectedItemColor: Colors.blue, // Color when selected
        unselectedItemColor: Colors.black, // Color when not selected
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

  // Function to build the icon in BottomNavigationBar
  Widget _buildIcon(String asset, bool isSelected) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.blue : Colors.black, // Change color based on selection
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

// Create Home screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Welcome to Home Screen!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
