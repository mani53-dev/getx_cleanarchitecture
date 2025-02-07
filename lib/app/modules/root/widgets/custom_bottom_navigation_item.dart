/* 
 * Author: Affine Sol (PVT LTD) - https://affinesol.com/ 
 * Last Modified: 05/02/2025 at 15:22:19
 */

import 'package:flutter/cupertino.dart';

class CustomBottomNavigationItem {
  final IconData iconUrl;
  final IconData selectedIconUrl;
  final String label;
  final Color color;

  CustomBottomNavigationItem({
    required this.iconUrl,
    required this.label,
    required this.color,
    required this.selectedIconUrl,
  });
}
