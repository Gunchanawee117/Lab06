import 'package:flutter/material.dart';
import 'package:lab06/pages/index.dart';
import 'package:lab06/pages/login.dart';
import 'package:lab06/pages/services/auth_service.dart';

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
        if (_formkey.currentState!.validate()) {
          print("ok");
          print(_emailcontroller.text);
          AuthService.registerUser(
                  _emailcontroller.text, _passwordcontroll.text)
              .then((value) {
            if (value == 1) {
              Navigator.pop(context);
            }
          });

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Pagelogin()));
        } else {
          print("try again");
        }
      },
      child: const Text('confirm Register'));

  TextFormField password() {
    return TextFormField(
      controller: _passwordcontroll,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอกรหัสผ่าน";
        }
        {
          return null;
        }
      },
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
