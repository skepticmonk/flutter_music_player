import 'package:flutter/material.dart';
import 'package:test/common/FormValidator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          TextButton(
            onPressed: (() => Navigator.pushReplacementNamed(context, '/')),
            child: const Icon(Icons.home),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Login Form',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontFamily: 'AvenirLight'),
              ),
              validator: validateEmail,
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enableSuggestions: false,
              autocorrect: false,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontFamily: 'AvenirLight'),
              ),
              validator: validateForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    if(emailController.text == 'admin@admin.com'){
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User Exists 👍')),
                    );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid User')),
                    );
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
