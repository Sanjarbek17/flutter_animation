import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/todo_page.dart';

class Register extends StatefulWidget {
  String username;
  String password;
  Register({super.key, required this.username, required this.password});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  bool h = true;
  bool hh = true;
  Icon icon = Icon(Icons.visibility_off);
  Icon iicon = Icon(Icons.visibility_off);
  TextEditingController username_control = TextEditingController();
  TextEditingController password_control = TextEditingController();
  TextEditingController cpassword_control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Column(
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700),
                      ),
                      Text('enter your username and password'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (username_control.text == '') {
                        return 'Enter username';
                      } else {
                        return null;
                      }
                    },
                    controller: username_control,
                    decoration: InputDecoration(hintText: 'username'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: ((value) {
                      if (password_control.text != cpassword_control.text ||
                          password_control.text.length < 4) {
                        return 'Invalid password';
                      } else {
                        return null;
                      }
                    }),
                    controller: password_control,
                    obscureText: h,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: icon,
                        onPressed: () {
                          setState(() {
                            h = !h;
                            h
                                ? icon = const Icon(Icons.visibility_off)
                                : icon = const Icon(Icons.visibility);
                          });
                        },
                      ),
                      hintText: 'password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: ((value) {
                      if (password_control.text != cpassword_control.text ||
                          cpassword_control.text.length < 4) {
                        return 'Invalid password';
                      } else {
                        return null;
                      }
                    }),
                    controller: cpassword_control,
                    obscureText: hh,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: iicon,
                        onPressed: () {
                          setState(() {
                            hh = !hh;
                            hh
                                ? iicon = const Icon(Icons.visibility_off)
                                : iicon = const Icon(Icons.visibility);
                          });
                        },
                      ),
                      hintText: 'confirm password',
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  width: 222,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                      if (password_control.text == cpassword_control.text &&
                          username_control.text != '') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(
                                username: username_control.text,
                                password: password_control.text),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF292929),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Image.asset('img/image2.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
