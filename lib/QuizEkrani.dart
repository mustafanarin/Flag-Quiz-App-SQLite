import 'dart:collection';

import 'package:flag_quiz_app/Bayraklar.dart';
import 'package:flag_quiz_app/BayraklarDAO.dart';
import 'package:flag_quiz_app/SonucEkrani.dart';
import 'package:flutter/material.dart';

import 'FlutterColor.dart';

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

    if(buttonIsim == dogruBayrak.bayrak_ad){
      dogruSayisi++;
    }else{
      yanlisSayisi++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterColor("#ede0d4"),
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: FlutterColor("#d4a373"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:16.0,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Doğru: $dogruSayisi",style: TextStyle(fontSize: 22),),
                  Text("Yanlış: $yanlisSayisi",style: TextStyle(fontSize: 22),)
                ],
              ),
            ),

            soruSayisi != 5 ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${soruSayisi+1}. Soru",style: TextStyle(fontSize: 30),),
            ) :
            Text("5. Soru",style: TextStyle(fontSize: 30),),

            Padding(
              padding: const EdgeInsets.only(top: 16.0,bottom: 8),
              child: Image.asset("images/$bayrakResimAdi"),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 210,
                child: ElevatedButton(
                    onPressed: () {
                      dogruOlcer(buttonA);
                      soruSayacKontrol();
                    },
                    child: Text(buttonA,style: TextStyle(color: Colors.black,fontSize: 25),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FlutterColor("#ddb892"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))
                      )
                    ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    dogruOlcer(buttonB);
                    soruSayacKontrol();
                  },
                  child: Text(buttonB,style: TextStyle(color: Colors.black,fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: FlutterColor("#ddb892"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))
                      )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    dogruOlcer(buttonC);
                    soruSayacKontrol();
                  },
                  child: Text(buttonC,style: TextStyle(color: Colors.black,fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: FlutterColor("#ddb892"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))
                      )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    dogruOlcer(buttonD);
                    soruSayacKontrol();
                  },
                  child: Text(buttonD,style: TextStyle(color: Colors.black,fontSize: 25),),
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
      ),
    );
  }
}

