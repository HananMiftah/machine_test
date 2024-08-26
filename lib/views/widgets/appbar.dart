import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 84, 200, 87),
      elevation: 4.0,
      leading: IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          // Handle cart icon action
        },
      ),
      title: Container(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search, color: Colors.black),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // Handle notification icon action
          },
        ),
      ],
    );
  }
}
