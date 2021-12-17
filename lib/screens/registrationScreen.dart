import 'package:flutter/material.dart';
import 'package:my_basket/screens/loginScreen.dart';
import 'package:my_basket/screens/mainNavigationScreen.dart';
import 'package:my_basket/services/firestoreAuthService.dart';

class RegistrationScreen extends StatefulWidget {
  //const Registration({ Key? key }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordVerification = TextEditingController();

  String initialLocation = 'Lilongwe';
  final locations = ['Mzuzu', 'Lilongwe', 'Blantyre', 'Zomba'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Screen")),
      body: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'First Name',
            ),
            controller: _firstName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Last Name',
            ),
            controller: _lastName,
          ),
        ),
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
          child: DropdownButton(
            value: initialLocation,
            icon: Icon(Icons.arrow_downward),
            items: locations.map((location) {
              return DropdownMenuItem(value: location, child: Text(location));
            }).toList(),
            onChanged: (location) {
              setState(() {
                initialLocation = location;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            controller: _password,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password Verification',
            ),
            controller: _passwordVerification,
            validator: (_passwordVerification) {
              if (_passwordVerification != _password.text.trim()) {
                return 'Please enter same password';
              }
              return null;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () async {
                  print("Register");
                  print(_firstName.text.trim());
                  print(_lastName.text.trim());
                  print(_email.text.trim());
                  print(_password.text.trim());
                  print(initialLocation);

                  String firstName = _firstName.text.trim();
                  String lastName = _lastName.text.trim();
                  String email = _email.text.trim();
                  String location = initialLocation;
                  String password = _passwordVerification.text.trim();

                  bool registrationCheck = await register(
                      firstName, lastName, location, email, password);

                  if (registrationCheck) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MainNavigation()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Unable to register!")));
                  }
                },
                child: Text("Register")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Back to Login")),
          ],
        )
      ])),
    );
  }
}
