import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, right: 50, left: 50),
      child: Column(
        children: [
          Text(
            "Contact",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam duis vitae curabitur amet, fermentum lorem. ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}