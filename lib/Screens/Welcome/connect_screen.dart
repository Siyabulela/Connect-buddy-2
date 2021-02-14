import 'package:Connect_buddy/Screens/Welcome/login_screen.dart';
import 'package:Connect_buddy/Screens/Welcome/components/headers.dart';
import 'package:Connect_buddy/Screens/Welcome/components/normalText.dart';
import 'package:Connect_buddy/Screens/Welcome/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConnectScreen extends StatelessWidget {
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
                press: () {},
              ),
            ),
            Positioned(
              child: Image.asset(
                'assets/images/connecting+logo.PNG',
                width: size.width * 0.9,
              ),
            ),
            HeaderText(text: 'Connect'),
            NormalText(
                text:
                    'You are able to request to as many\navailabe connections there are. Just have\nyour tokens ready and begin the reliable\ninternet connection journey of your\ndreams'),
            Positioned(
              top: 0,
              right: 0,
              child: RoundedButton(
                text: 'Get started',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
