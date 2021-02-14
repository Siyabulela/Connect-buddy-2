import 'package:flutter/material.dart';
import '../../../constants.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color color, textColor;
  const NormalText({
    Key key,
    this.text,
    this.color = kPrimaryLightColor,
    this.textColor = kPrimaryColor,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
