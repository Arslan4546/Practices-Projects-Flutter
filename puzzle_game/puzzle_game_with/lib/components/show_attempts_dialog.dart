import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reset_tiles.dart';

// Function to show the dialog box when 30 attempts are reached
void showAttemptsDialog(BuildContext context, StateSetter setState, List<String?> tiles, int count) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 7,
        title: Text(
          "Game Over!",
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text(
          "You have used your 30 attempts!",
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              resetTiles(setState, tiles, count); // Reset the puzzle
            },
            child: const Text(
              "OK",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
