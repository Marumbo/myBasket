import 'package:flutter/material.dart';
import 'package:my_basket/screens/mainNavigationScreen.dart';
import 'package:my_basket/screens/registrationScreen.dart';
import 'package:my_basket/services/firestoreAuthService.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log in")),
      body: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
            controller: _email,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            controller: _password,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () async {
                  print("Login button");
                  print(_email.text.trim());
                  print(_password.text.trim());

                  String email = _email.text.trim();
                  String password = _password.text.trim();

                  bool signInCheck = await signIn(email, password);

                  if (signInCheck) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MainNavigation()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Unable to sign in!")));
                  }
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RegistrationScreen()));
                },
                child: Text("Register First")),
          ],
        )
      ])),
    );
  }
}
