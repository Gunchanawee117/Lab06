import 'package:flutter/material.dart';
import 'package:lab06/pages/login.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

final GlobalKey<FormState> _formkey = GlobalKey();

class _IndexpageState extends State<Indexpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: SafeArea(
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
            ),
            Text(' Login Successful'),
          ],
        ),
      ),
    );
  }

  ElevatedButton backbutton() => ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pagelogin()));
        },
        child: const Text('back to login page.'),
      );
}
