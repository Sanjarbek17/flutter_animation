import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animation/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: '');
  List api = [];

  bool value1 = false;
  bool builder = false;
  DateTime now =DateTime.now();
  List weekdays=[
    "Monday",'Tuesday',"Wednesday","Thursdday","Friday","Saturday",'Sunday'
  ];
  
  // getApi() async {
  //   api = await func();
  // }

  addApi() async {
    
    print(now.day);
    await adding(controller.text);
    api = await func();
    setState(() {});
    controller.text = '';
  }


  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    api=await func();
    //sleep(Duration(seconds: 5));
    print('end');
    setState(() {
      builder = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (builder) {
      return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    now=DateTime.now();
                  });
                },
                child: Scaffold(
                  body: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 24),
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
                                    Color.fromARGB(
                                        (0.4 * 255).toInt(), 255, 255, 255),
                                    Color.fromARGB(
                                        (0.276 * 255).toInt(), 255, 255, 255),
                                  ],
                                ),
                              ),
                              child: TextField(
                                
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 90, 85, 85),
                                  fontSize: 17,
                                ),
                                controller: controller,
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(color: Colors.white),
                                    filled: false,
                                    fillColor: Colors.white,
                                    suffixIcon: IconButton(
                                      onPressed: addApi,
                                      icon: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      ),
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
                              'Good Morning, Ogabek!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            ),
                             Text(
                              '${now.day}-${now.month}-${now.year}  ${weekdays[now.weekday-1]} ',
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
                          child: ListView.builder(
                            itemCount: api.length,
                            itemBuilder: (context, index) => Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              margin: const EdgeInsets.only(top: 17),
                              elevation: 14,
                              shadowColor:
                                  Color.fromARGB((0.14 * 255).toInt(), 0, 0, 0),
                              child: Dismissible(
                                key: ValueKey(api[index]),
                                onDismissed: (direction) async{
                                  await removing(api[index]['name']);
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: api[index]['isDone'],
                                      onChanged: (value) {
                                        setState(() {
                                          api[index]['isDone']=value;
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(api[index]['name']),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
