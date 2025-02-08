import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Puzzle Game',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Puzzle Game'),
//     );
//   }
// }

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

  // Function to reset the tiles to the original state
  void resetTiles() {
    setState(() {
      tiles = [
        'Assets/Images/1.png',
        'Assets/Images/2.png',
        'Assets/Images/3.png',
        'Assets/Images/4.png',
        'Assets/Images/5.png',
        'Assets/Images/6.png',
        'Assets/Images/7.png',
        'Assets/Images/8.png',
        null, // Reset empty slot
      ];
      _count = 0; // Reset the attempt counter
    });
  }

  // Function to show the dialog box when 50 attempts are reached
  void showAttemptsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 7,
          title: Text("Game Over!",
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
          content: Text("You have used your 30 attempts!",
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                resetTiles(); // Optional: Reset the puzzle if needed
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

  // Function to move a tile if it is adjacent to the empty slot
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
        // Swap the tiles
        tiles[emptyIndex] = tiles[index];
        tiles[index] = null;
        _count++;

        // Show dialog if 50 attempts are reached
        if (_count == 30) {
          showAttemptsDialog();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.title,
            style: GoogleFonts.lovedByTheKing(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
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
                          child: Text(" You Have Only 30 \n Attempts To Solve ",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
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
                          child:
                              Text(" Attempts Count : \n              $_count",
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
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
                        child: Text(" Original Picture",
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
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
                      buildTile(0),
                      buildTile(1),
                      buildTile(2),
                    ],
                  ),
                  Row(
                    children: [
                      buildTile(3),
                      buildTile(4),
                      buildTile(5),
                    ],
                  ),
                  Row(
                    children: [
                      buildTile(6),
                      buildTile(7),
                      buildTile(8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetTiles,
        backgroundColor: Colors.grey,
        tooltip: 'Reset Puzzle',
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  Widget buildTile(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => moveTile(index),
        child: Container(
          height: 80,
          margin: const EdgeInsets.all(2),
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
}
