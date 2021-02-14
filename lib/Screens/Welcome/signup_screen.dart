import 'package:Connect_buddy/Screens/Welcome/components/rounded_button.dart';
import 'package:Connect_buddy/Screens/Welcome/login_screen.dart';
import 'package:Connect_buddy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Build an alert dialog to display some errors.
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

  // Create a new user account
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
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
      _registerFormLoading = true;
    });

    // Run the create account method
    String _createAccountFeedback = await _createAccount();

    // If the string is not null, we got error while create account.
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      // The String was null, user is logged in.
      Navigator.pop(context);
    }
  }

  // Default Form Loading State
  bool _registerFormLoading = false;

  // Form Input Field Values
  String _registerEmail = "";
  String _registerPassword = "";
  String _nameAndSurname = "";
  String _registerPasswordConf = "";
  String _phonenumber = "";

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
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("assets/images/signup.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 160,
            ),
            Text(
              "Create\nyour account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              onChanged: (value) {
                _nameAndSurname = value;
              },
              onSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined),
                  hintText: "First name and last name",
                  hintStyle: TextStyle(color: Colors.white),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF424242)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                _phonenumber = value;
              },
              onSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_outlined),
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.white),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF424242)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                _registerEmail = value;
              },
              onSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
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
            TextField(
              onChanged: (value) {
                _registerPassword = value;
              },
              focusNode: _passwordFocusNode,
              onSubmitted: (value) {
                _submitForm();
              },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF424242)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                _registerPasswordConf = value;
              },
              focusNode: _passwordFocusNode,
              onSubmitted: (value) {
                _submitForm();
              },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFF424242)))),
            ),
            SizedBox(
              height: 100,
            ),
            RoundedButton(
              text: 'Sign Up',
              press: () {
                _submitForm();
              },
              width: size.width * 0.9,
              color: kPrimaryLightColor,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Already have an account?",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: " Sign In",
                          style: TextStyle(color: kPrimaryLightColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
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
          ],
        ),
      ),
    );
  }
}
