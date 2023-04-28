import 'package:flutter/material.dart';
import 'package:payscore/Services/authcreate.dart';
import 'package:payscore/Widgets/mytextfield.dart';
import 'package:payscore/Widgets/mybutton.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

final AuthService _auth = AuthService();

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Registration Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                MyTextField(
                  labelText: 'Email',
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value.trim();
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyTextField(
                  labelText: 'Password',
                  validator: (value) => value!.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null,
                  onChanged: (value) {
                    setState(() {
                      password = value.trim();
                    });
                  },
                ),
                const SizedBox(height: 12.0),
                MyTextField(
                  labelText: 'Confirm Password',
                  validator: (value) =>
                      value != password ? 'Passwords do not match' : null,
                  onChanged: (value) {
                    setState(() {
                      confirmPassword = value.trim();
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                MyButton(
                    buttonText: 'Register',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Error registering, please try again';
                          });
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(
                              context, '/VerifyEmail');
                        }
                      }
                    }),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
