import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  int _getCurrentIndex(String? routeName) {
    switch (routeName) {
      case '/home':
        return 0;
      case '/notification':
        return 1;
      case '/cart':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  void _onTap(BuildContext context, int index) {
    final routes = ['/home', '/notification', '/cart', '/profile'];
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final currentIndex = _getCurrentIndex(currentRoute);

    if (index != currentIndex) {
      Navigator.pushNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final selectedIndex = _getCurrentIndex(currentRoute);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      onTap: (index) => _onTap(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: _NavIcon('assets/images/Home.png', route: '/home'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon(
            'assets/images/mdi-light_bell.png',
            route: '/notification',
          ),
          label: 'แจ้งเตือน',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon('assets/images/Crash.png', route: '/cart'),
          label: 'ตะกร้า',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon('assets/images/weui_me-filled.png', route: '/profile'),
          label: 'ฉัน',
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  final String asset;
  final String route;

  const _NavIcon(this.asset, {required this.route});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final isSelected = currentRoute == route;

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.blue : Colors.black,
        BlendMode.srcIn,
      ),
      child: Image.asset(asset, width: 30, height: 30),
    );
  }
}
