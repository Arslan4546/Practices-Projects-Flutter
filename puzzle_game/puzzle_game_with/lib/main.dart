import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/reset_tiles.dart';
import 'components/show_attempts_dialog.dart';
import 'components/tile_widget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  List<String?> tiles = [
    'Assets/Images/5.png',
    'Assets/Images/6.png',
    'Assets/Images/8.png',
    'Assets/Images/7.png',
    'Assets/Images/4.png',
    'Assets/Images/2.png',
    'Assets/Images/1.png',
    'Assets/Images/3.png',
    null, // This represents the empty slot
  ];

  // Move tile function
  void moveTile(int index) {
    int emptyIndex = tiles.indexOf(null);

    // Calculate possible moves (left, right, up, down)
    List<int> possibleMoves = [
      index - 1, // Left
      index + 1, // Right
      index - 3, // Up
      index + 3, // Down
    ];

    // Check if the empty index is a valid adjacent move
    if (possibleMoves.contains(emptyIndex)) {
      setState(() {
        tiles[emptyIndex] = tiles[index];
        tiles[index] = null;
        _count++;

        // Show dialog if 30 attempts are reached
        if (_count == 30) {
          showAttemptsDialog(context, setState, tiles, _count);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          widget.title,
          style: GoogleFonts.lovedByTheKing(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
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
                        child: Center(
                          child: Text(
                            " You Have Only 30 \n Attempts To Solve ",
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
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
                        child: Center(
                          child: Text(
                            " Attempts Count : \n              $_count",
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 30,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        boxShadow: [
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
                      child: Center(
                        child: Text(
                          " Original Picture",
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 110,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        boxShadow: [
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
                      child: const Image(
                        image: AssetImage("Assets/Images/Elephant.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      buildTile(0, tiles, moveTile),
                      buildTile(1, tiles, moveTile),
                      buildTile(2, tiles, moveTile),
                    ],
                  ),
                  Row(
                    children: [
                      buildTile(3, tiles, moveTile),
                      buildTile(4, tiles, moveTile),
                      buildTile(5, tiles, moveTile),
                    ],
                  ),
                  Row(
                    children: [
                      buildTile(6, tiles, moveTile),
                      buildTile(7, tiles, moveTile),
                      buildTile(8, tiles, moveTile),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => resetTiles(setState, tiles, _count),
        backgroundColor: Colors.grey,
        tooltip: 'Reset Puzzle',
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
