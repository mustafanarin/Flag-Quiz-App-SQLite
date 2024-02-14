import 'dart:collection';

import 'package:flag_quiz_app/Bayraklar.dart';
import 'package:flag_quiz_app/BayraklarDAO.dart';
import 'package:flag_quiz_app/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  String buttonA = "";
  String buttonB = "";
  String buttonC = "";
  String buttonD = "";
  String bayrakResimAdi = "placeholder.png";

  int soruSayisi = 0;
  int dogruSayisi = 0;
  int yanlisSayisi = 0;

  List<Bayraklar> sorular = [];
  List<Bayraklar> yanlisSecenekler = [];

  var tumSorular = HashSet();

  late Bayraklar dogruBayrak;

  @override
  void initState() {
    super.initState();

    sorulariGetir();
  }

  Future<void> sorulariGetir() async{

    sorular = await BayraklarDAO().dogruSecenek5Bayrak();

    soruYukle();
  }

  Future<void> soruYukle() async{

    dogruBayrak = sorular[soruSayisi];

    bayrakResimAdi = dogruBayrak.bayrak_resim;

    yanlisSecenekler = await BayraklarDAO().yanlisSecenek3Bayrak(dogruBayrak.bayrak_id);

    tumSorular.clear();
    tumSorular.add(yanlisSecenekler[0]);
    tumSorular.add(yanlisSecenekler[1]);
    tumSorular.add(yanlisSecenekler[2]);
    tumSorular.add(dogruBayrak);

    buttonA = tumSorular.elementAt(0).bayrak_ad;
    buttonB = tumSorular.elementAt(1).bayrak_ad;
    buttonC = tumSorular.elementAt(2).bayrak_ad;
    buttonD = tumSorular.elementAt(3).bayrak_ad;

    setState(() {
    });


  }

  void soruSayacKontrol(){
    soruSayisi++;

    if(soruSayisi != 5){
      soruYukle();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi)));
    }
  }

  void dogruOlcer(String buttonIsim){

    if(buttonIsim == sorular[soruSayisi].bayrak_ad){
      dogruSayisi++;
    }else{
      yanlisSayisi++;
    }
  }

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
                Text("Doğru: $dogruSayisi"),
                Text("Yanlış: $yanlisSayisi")
              ],
            ),

            soruSayisi != 5 ? Text("${soruSayisi+1}. Soru") :

            Image.asset("images/$bayrakResimAdi"),

            ElevatedButton(
                onPressed: () {
                  soruSayacKontrol();
                  dogruOlcer(buttonA);
                },
                child: Text(buttonA)),

            ElevatedButton(
                onPressed: () {
                  soruSayacKontrol();
                  dogruOlcer(buttonB);
                },
                child: Text(buttonB)),
            ElevatedButton(
                onPressed: () {
                  soruSayacKontrol();
                  dogruOlcer(buttonC);
                },
                child: Text(buttonC)),
            ElevatedButton(
                onPressed: () {
                  soruSayacKontrol();
                  dogruOlcer(buttonD);
                },
                child: Text(buttonD)),

          ],
        ),
      ),
    );
  }
}
