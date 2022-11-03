import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/register.dart';
import 'package:flutter_animation/pages/todo_page.dart';

class SignIn extends StatefulWidget {
  String username;
  String password;
  SignIn({super.key, required this.password, required this.username});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    final formkey = GlobalKey<FormState>();

  bool h = true;
  Icon icon = Icon(Icons.visibility_off);
  TextEditingController username_control = TextEditingController();
  TextEditingController password_control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: const [
                      Text(
                        'Welcome Back',
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
                      if (username_control != '') {
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
                      if (password_control.text !=''||password_control.text.length<4) {
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
                const SizedBox(height: 30),
                Container(
                  width: 222,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (formkey.currentState!.validate()) {}
                        if (username_control.text != '' && password_control.text != '') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyApp(
                                  username: username_control.text,
                                  password: password_control.text),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF292929),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(
                                username: widget.username,
                                password: widget.password),
                          ));
                    });
                  },
                  child: Text('Don\'t have an account'),
                ),
                const SizedBox(height: 50),
                Image.asset('img/image2.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
