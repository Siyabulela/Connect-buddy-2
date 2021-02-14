import 'package:flutter/material.dart'; 
import '../../../constants.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Color color, textColor;
  const HeaderText({
    Key key,
    this.text,
    this.color = kPrimaryLightColor,
    this.textColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30.0, color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
