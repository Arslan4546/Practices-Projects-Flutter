import 'package:flutter/material.dart';

// Function to reset the tiles to the original state
void resetTiles(StateSetter setState, List<String?> tiles, int count) {
  setState(() {
    tiles.setAll(0, [
      'Assets/Images/1.png',
      'Assets/Images/2.png',
      'Assets/Images/3.png',
      'Assets/Images/4.png',
      'Assets/Images/5.png',
      'Assets/Images/6.png',
      'Assets/Images/7.png',
      'Assets/Images/8.png',
      null, // Reset empty slot
    ]);
    count = 0; // Reset the attempt counter
  });
}
