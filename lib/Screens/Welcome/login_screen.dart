import 'package:Connect_buddy/Screens/Welcome/components/rounded_button.dart';
import 'package:Connect_buddy/Screens/Welcome/signup_screen.dart';
import 'package:Connect_buddy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // Login to existing user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if (_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("assets/images/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              "Hello,\nWelcome Back",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            //EMAIL TEXTFIELD
            TextField(
              onChanged: (value) {
                _loginEmail = value;
              },
              onSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
              style: TextStyle(color: Colors.white),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF424242)))),
            ),
            SizedBox(
              height: 10,
            ),
            //PASSWORD TEXTFIELD
            TextField(
              onChanged: (value) {
                _loginPassword = value;
              },
              focusNode: _passwordFocusNode,
              onSubmitted: (value) {
                _submitForm();
              },
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open_outlined),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF424242)))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "I forgot my password?",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 170,
            ),
            RoundedButton(
              text: 'Login',
              press: () {
                _submitForm();
              },
              width: size.width * 0.9,
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Don't have an account?",
                    textAlign: TextAlign.end,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: " Sign Up",
                          style: TextStyle(color: Colors.white),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignupScreen();
                                  },
                                ),
                              );
                            },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: const Divider(
                    color: kPrimaryColor,
                    height: 5,
                    indent: 0,
                    endIndent: 0,
                    thickness: 3,
                  ),
                ),
                Expanded(
                  child: Text(" OR "),
                  flex: 0,
                ),
                Expanded(
                  child: const Divider(
                    color: kPrimaryColor,
                    height: 5,
                    indent: 0,
                    endIndent: 0,
                    thickness: 3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            RoundedButton(
              text: 'Continue with Google',
              press: () {},
              width: size.width * 0.9,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
