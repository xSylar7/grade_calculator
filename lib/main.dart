import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final controller = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
                  int? grade = int.tryParse(controller.text);

                  if (grade == null) {
                    print('${controller.text} is not a number!');
                    return;
                  }
                  if (grade < 0) {
                    print('grade cant be less than 0');
                  } else if (grade >= 90) {
                    print('A');
                  } else if (grade >= 80) {
                    print('B');
                  } else if (grade >= 70) {
                    print('C');
                  } else if (grade >= 60) {
                    print('D');
                  } else {
                    print('F');
                  }
                },
                style: ButtonStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
