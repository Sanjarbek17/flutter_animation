import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/todo_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

bool h = true;
bool hh = true;
Icon icon = Icon(Icons.visibility_off);
Icon iicon = Icon(Icons.visibility_off);
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController cpassword = TextEditingController();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(35),
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: cpassword,
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
              const SizedBox(height: 30),
              Container(
                width: 222,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                  child: Text(
                    'Register',
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
              const SizedBox(height: 14),
              Image.asset('img/image2.png')
            ],
          ),
        ),
      ),
    );
  }
}
