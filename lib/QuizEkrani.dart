import 'package:flag_quiz_app/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Doğru: 3"),
                Text("Yanlış: 2")
              ],
            ),
            
            Text("1. Soru"),

            Image.asset("images/turkiye.png"),

            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(3)));
                },
                child: Text("Button A")),

            ElevatedButton(
                onPressed: () {

                },
                child: Text("Button B")),
            ElevatedButton(
                onPressed: () {

                },
                child: Text("Button C")),
            ElevatedButton(
                onPressed: () {

                },
                child: Text("Button D")),

          ],
        ),
      ),
    );
  }
}
