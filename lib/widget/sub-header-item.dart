import 'package:flutter/material.dart';

class SubHeaderItem extends StatelessWidget {
  final String number;
  final String name;
  final String imagePath;
  SubHeaderItem(this.number, this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(number,
                  style: const TextStyle(
                      letterSpacing: -2,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
              Spacer(),
              Image.asset(imagePath, height: 20,)
            ],
          ),
          Text(name,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.grey.shade600, fontSize: 15)),
        ],
      ),
    );
  }
}
