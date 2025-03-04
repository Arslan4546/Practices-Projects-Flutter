import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GetStartedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD640),
        minimumSize: Size(size.width * 0.9, size.height * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.width * 0.05,
          color: Colors.black,
        ),
      ),
    );
  }
}
