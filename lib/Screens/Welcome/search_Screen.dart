import 'package:Connect_buddy/Screens/Welcome/components/headers.dart';
import 'package:Connect_buddy/Screens/Welcome/components/normalText.dart';
import 'package:Connect_buddy/Screens/Welcome/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF052638),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: RoundedButton(
                text: 'English',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
              child: Image.asset(
                'assets/images/Search+logo.PNG',
                width: size.width * 0.9,
              ),
            ),
            HeaderText(text: 'Search'),
            NormalText(
                text:
                    'Is your network connectivity low? Don\'t\nworry, we have you covered. Search\nfor available networks at your current\nlocation or any other location, with only\none click'),
          ],
        ),
      ),
    );
  }
}
