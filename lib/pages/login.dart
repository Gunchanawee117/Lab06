import 'package:flutter/material.dart';
import 'package:lab06/pages/register.dart';

class Pagelogin extends StatefulWidget {
  const Pagelogin({super.key});

  @override
  State<Pagelogin> createState() => _PageloginState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroll = TextEditingController();

class _PageloginState extends State<Pagelogin> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(
          children: [
            email(),
            password(),
            login(),
            register(),
          ],
        ),
      )),
    );
  }

  ElevatedButton register() => ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Registerpage()));
        },
        child: const Text('Register'),
      );

  ElevatedButton login() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          print('ok');
        }
      },
      child: const Text('Login'),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: _passwordcontroll,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        labelText: 'Input password',
      ),
      obscureText: true,
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
