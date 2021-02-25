import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller
// Contains functionality for BottomNavigationBar
class BottomNavigationBarController extends GetxController {
  var _selectedIndex = 0.obs;

  // selectedIndex
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}