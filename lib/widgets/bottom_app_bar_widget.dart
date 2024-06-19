import 'package:flutter/material.dart';

import 'bottom_app_bar_clipper.dart';

class BottomAppBarWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: ClipPath(
        clipper: BottomAppBarClipper(),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF45278B), Color(0xFF2E335A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              SizedBox(width: 40), // Space for the FAB
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

