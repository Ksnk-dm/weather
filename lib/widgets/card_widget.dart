import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {

  final String cardName;

  const CardWidget({super.key, required this.cardName});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3E2D8F),
              Color(0xFF9D52AC),
            ],
          ),
        ),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Center(
            child: Text(cardName),
          ),
        ),
      ),
    );
  }
}
