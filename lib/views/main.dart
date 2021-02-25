import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_of_legends/controllers/bottomnavigationbar_controller.dart';
import 'package:league_of_legends/views/champions/champions.dart';
import 'package:league_of_legends/views/home/home.dart';
import 'package:league_of_legends/views/items/items.dart';
import 'package:league_of_legends/views/shop/shop.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // BottomNavigationBar Controller
  final BottomNavigationBarController bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  final List<Widget> screens = <Widget>[Home(), Champions(), Items(), Shop()];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        // AppBar - Application Name (Placeholder)
        appBar: AppBar(
          title: Text('League of Legends'),
        ),
        // Centered Screens
        body: Obx(
          () => Center(
            child: screens.elementAt(bottomNavigationBarController.selectedIndex),
          ),
        ),
        // BottomNavigationBar - Home, Champions, Items, Shop
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group), label: 'Champions'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.construction), label: 'Items'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Shop')
            ],
            currentIndex: bottomNavigationBarController.selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: (index) =>
                bottomNavigationBarController.selectedIndex = index,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
