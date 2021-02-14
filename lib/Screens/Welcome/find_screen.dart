import 'package:Connect_buddy/Screens/Welcome/components/headers.dart';
import 'package:Connect_buddy/Screens/Welcome/components/normalText.dart';
import 'package:Connect_buddy/Screens/Welcome/components/rounded_button.dart'; 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindScreen extends StatelessWidget {
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
                        return FindScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
              child: Image.asset(
                'assets/images/find+logo.PNG',
                width: size.width * 0.9,
              ),
            ),
            HeaderText(text: 'Find'),
            NormalText(
                text:
                    'The app will find all the aivalable networks\nthat you can connect to. You will  be able\nto see the ISP for each available\nconnection along with a stats summary\nand be able to request to the connection\nyou want using your available tokens.'),
          ],
        ),
      ),
    );
  }
}
