import 'package:flutter/material.dart';

// Widget to build each tile in the puzzle
Widget buildTile(int index, List<String?> tiles, void Function(int) moveTile) {
  return Expanded(
    child: GestureDetector(
      onTap: () => moveTile(index),
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: tiles[index] != null ? Colors.white : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 3,
              spreadRadius: 4,
              color: Colors.white,
            ),
            BoxShadow(
              offset: Offset(-3, -3),
              blurRadius: 3,
              spreadRadius: 4,
              color: Colors.black,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: tiles[index] != null
            ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(tiles[index]!),
              fit: BoxFit.fill,
            ),
          ),
        )
            : Container(),
      ),
    ),
  );
}
