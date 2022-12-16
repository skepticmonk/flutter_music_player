import 'package:flutter/material.dart';

class RouteButton extends StatelessWidget {
  final String path;
  final String label; 
 
 const RouteButton( this.path, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
            child: Container(
              height: 150,
              width: 150,
              color: Colors.blue[100],
              child:  Center(
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const Songs()),
              // );
              Navigator.pushReplacementNamed(context, path);
            },
          );
  }
}