import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  String gradeResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Write your grade!',
                    prefixIcon: Icon(
                      CupertinoIcons.percent,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text(
                  'Calculate'.toUpperCase(),
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  setState(() {
                    gradeResult;
                  });
                  int? grade = int.tryParse(controller.text);

                  if (grade == null) {
                    print('${controller.text} is not a number!');
                    return;
                  }
                  if (grade < 0) {
                    print('grade cant be less than 0');
                  } else if (grade >= 90) {
                    print('A');
                    gradeResult = ('A');
                  } else if (grade >= 80) {
                    print('B');
                    gradeResult = ('B');
                  } else if (grade >= 70) {
                    print('C');
                    gradeResult = ('C');
                  } else if (grade >= 60) {
                    print('D');
                    gradeResult = ('D');
                  } else {
                    print('F');
                    gradeResult = ('F');
                  }
                },
              ),
            ),
            Container(
              child: Text(
                '$gradeResult',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
