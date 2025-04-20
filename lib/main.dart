import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/contact.dart';
import 'pages/pay.dart';
import 'pages/sign_in.dart';
import 'pages/cart.dart';
import 'pages/profile.dart';
import 'pages/chat_page.dart';
import 'pages/notification.dart' as notify;
import 'services/cart_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',

      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final args = settings.arguments as Map<String, dynamic>?;
          final fullname = args?['fullname'] ?? 'Guest';
          return MaterialPageRoute(
            builder: (context) => HomeScreen(fullname: fullname),
          );
        }

        if (settings.name == '/pay') {
          final args = settings.arguments as Map<String, dynamic>?;
          final customerId = args?['customerid'] ?? '';
          return MaterialPageRoute(
            builder: (context) => QRPaymentPage(customerId: customerId),
          );
        }

        if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, dynamic>?;
          final customerid = args?['customerid'] ?? '';
          return MaterialPageRoute(
            builder: (context) => ProfilePage(customerid: customerid),
          );
        }

        return null; // fallback
      },

      routes: {
        '/login': (context) => LoginScreen(),
        '/contact': (context) => ContactPage(),
        '/sign_in': (context) => SignInScreen(),
        '/notification': (context) => notify.NotificationPage(),
        '/cart': (context) => CartPage(),
        '/chat': (context) => ChatPage(chatName: 'ชื่อที่ส่งมา'),
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'pages/home.dart';
// import 'pages/login.dart';
// import 'pages/contact.dart';
// import 'pages/pay.dart';
// import 'pages/sign_in.dart';
// import 'pages/cart.dart';
// import 'pages/profile.dart';
// import 'pages/chat_page.dart';
// import 'pages/notification.dart' as notify;
// import 'services/cart_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CartService(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Main App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: '/login',

//       onGenerateRoute: (settings) {
//         if (settings.name == '/home') {
//           final args = settings.arguments as Map<String, dynamic>?;
//           final fullname = args?['fullname'] ?? 'Guest';
//           return MaterialPageRoute(
//             builder: (context) => HomeScreen(fullname: fullname),
//           );
//         }

//         if (settings.name == '/pay') {
//           final args = settings.arguments as Map<String, dynamic>?;
//           final customerId = args?['customerid'] ?? '';
//           return MaterialPageRoute(
//             builder: (context) => QRPaymentPage(customerId: customerId),
//           );
//         }

//         if (settings.name == '/profile') {
//           final args = settings.arguments as Map<String, dynamic>?;
//           final customerid = args?['customerid'] ?? '';
//           return MaterialPageRoute(
//             builder: (context) => ProfilePage(customerid: customerid),
//           );
//         }

//         return null; // fallback
//       },

//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/contact': (context) => ContactPage(),
//         '/sign_in': (context) => SignInScreen(),
//         '/notification': (context) => notify.NotificationPage(),
//         '/cart': (context) => CartPage(),
//         '/chat': (context) => ChatPage(chatName: 'ชื่อที่ส่งมา'),
//       },
//     );
//   }
// }