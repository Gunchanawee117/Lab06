import 'package:flutter/material.dart';
import 'package:lab06/pages/login.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroll = TextEditingController();

class _RegisterpageState extends State<Registerpage> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register form')),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(
          children: [
            email(),
            password(),
            register(),
          ],
        ),
      )),
    );
  }

  ElevatedButton register() => ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagelogin()));
      },
      child: const Text('confirm Register'));

  TextFormField password() {
    return TextFormField(
      controller: _passwordcontroll,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        labelText: 'Input password',
      ),
    );
  }

  TextFormField email() {
    return TextFormField(
      controller: _emailcontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Input email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอกใหม่";
        }
        {
          return null;
        }
      },
    );
  }
}
