import 'package:flag_quiz_app/QuizEkrani.dart';
import 'package:flutter/material.dart';

import 'FlutterColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flag Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FlutterColor("#ede0d4"),
      appBar: AppBar(
        backgroundColor: FlutterColor("#d4a373"),
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("QUIZE HOŞGELDİNİZ",style: TextStyle(fontSize: 30),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani()));
                  },
                  child: Text("BAŞLA",style: TextStyle(color: Colors.black,fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: FlutterColor("#ddb892"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
