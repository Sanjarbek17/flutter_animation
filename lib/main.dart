import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  TextEditingController controller = TextEditingController(text: '');
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 24),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/back_img.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        end: Alignment.centerRight,
                        begin: Alignment.centerLeft,
                        colors: [
                          Color.fromARGB((0.4 * 255).toInt(), 255, 255, 255),
                          Color.fromARGB((0.276 * 255).toInt(), 255, 255, 255),
                        ],
                      ),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: false,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    height: 26,
                  ),
                  const Text(
                    'Good Morning, Sanjarbek!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    '17th Feb, 2022',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 24,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.only(top: 17),
                      elevation: 14,
                      shadowColor:
                          Color.fromARGB((0.14 * 255).toInt(), 0, 0, 0),
                      child: Row(
                        children: [
                          Checkbox(value: value, onChanged: ((value) {})),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text('Arrange a weekly meet.'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
