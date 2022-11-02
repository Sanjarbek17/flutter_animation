import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/register.dart';
import 'package:flutter_animation/pages/todo_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

bool h = true;
Icon icon = Icon(Icons.visibility_off);
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
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
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(hintText: 'username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: password,
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
                      if (username.text != '' && password.text != '') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
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
                          builder: (context) => Register(),
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
    );
  }
}
