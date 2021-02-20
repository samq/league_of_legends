import 'package:flutter/material.dart';
import 'screens/champions.dart';
import 'screens/home.dart';
import 'screens/items.dart';
import 'screens/shop.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  // Home - Initial Screen
  int _selectedIndex = 0;

  // Screens - Home, Champions, Items, Shop
  List<Widget> _screens = <Widget>[
    Home(),
    Champions(),
    Items(),
    Shop()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // AppBar - Application Name (Placeholder)
        appBar: AppBar(
          title: Text('League of Legends'),
        ),
        // Centered Screens
        body: Center(
          child: _screens.elementAt(_selectedIndex)
        ),
        // BottomNavigationBar - Home, Champions, Items, Shop
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Champions'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.construction),
                label: 'Items'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Shop'
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      )
    );
  }
}
