import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_of_legends/controllers/bottomnavigationbar_controller.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // BottomNavigationBar Controller
  final BottomNavigationBarController bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) =>
      // GetMaterialApp - Required for Get Route Navigation, ETC.
      // Child - MaterialApp (Default)
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // WillPopScope
        home: WillPopScope(
          // Called to veto attempts by the user to dismiss enclosed ModalRoute
          // Returns false if navigator can pop, or true otherwise
          onWillPop: () async => !await bottomNavigationBarController
              .currentNavigator.currentState
              .maybePop(),
          child: Scaffold(
            body: _buildBody(),
            // BottomNavigationBar - Home, Champions, Items, Shop
            bottomNavigationBar: _buildBottomNavigationBar(),
          ),
        ),
      );

  // Builds the main
  Widget _buildBody() {
    return Obx(() {
      // Navigator - "Nested" Navigator for managing separate stack of widgets
      // Responsible for managing stack in each "Tab"
      return Navigator(
        key: bottomNavigationBarController.currentNavigator,
        onGenerateRoute: (context) => MaterialPageRoute(
          builder: (context) => bottomNavigationBarController.currentScreen,
        ),
      );
    });
  }

  // Builds the BottomNavigationBar
  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Items - Home, Champions, Items, Shop
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Champions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction), label: 'Items'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Shop')
        ],
        currentIndex: bottomNavigationBarController.currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => bottomNavigationBarController.selectTab(index),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
