import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_of_legends/views/champions/champions.dart';
import 'package:league_of_legends/views/home/home.dart';
import 'package:league_of_legends/views/items/items.dart';
import 'package:league_of_legends/views/shop/shop.dart';

// Controller
// Contains functionality for custom BottomNavigationBar
//
class BottomNavigationBarController extends GetxController {
  // Observed Values
  // Index - BottomNavigationBar / NavigationBarItem
  var _currentIndex = 0.obs;

  // Screens - Ordered via index
  // Navigator Widget - navigatorKey
  List<Widget> _screens = <Widget>[Home(), Champions(), Items(), Shop()];
  // Page Keys
  List<String> _pageKeys = ['Home', 'Champions', 'Items', 'Shop'];
  // Map - String to GlobalKey
  // GlobalKey - Unique key for identifying elements
  // NavigatorState - Navigator's State
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'Home': GlobalKey<NavigatorState>(),
    'Champions': GlobalKey<NavigatorState>(),
    'Items': GlobalKey<NavigatorState>(),
    'Shop': GlobalKey<NavigatorState>(),
  };

  // selectedIndex
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) => _currentIndex.value = index;
  // pageKeys
  String get currentPage => _pageKeys[currentIndex];
  // navigatorKey
  GlobalKey<NavigatorState> get currentNavigator => _navigatorKeys[currentPage];
  // currentScreen
  Widget get currentScreen => _screens[currentIndex];

  // Method called when user hits on a NavigationBarItem
  void selectTab(int index) {
    // User selected different NavigationBarItem
    // Navigate to selected tab
    if (index != currentIndex) {
      currentIndex = index;
    }
    // User selected same NavigationBarItem
    // Must pop all routes in the corresponding Navigator until first route
    else {
      currentNavigator.currentState.popUntil((route) => route.isFirst);
    }
  }
}
