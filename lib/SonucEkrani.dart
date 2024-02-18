import 'package:flag_quiz_app/FlutterColor.dart';
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  int dogruSayisi;
  SonucEkrani(this.dogruSayisi);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  int tumSorular = 5;
  int basariYuzdesi = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterColor("#ede0d4"),
      appBar: AppBar(
        title: Text("Sonuçlar"),
        backgroundColor: FlutterColor("#d4a373"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.dogruSayisi} DOĞRU ${tumSorular - widget.dogruSayisi} YANLIŞ",style: TextStyle(fontSize: 25),),

            Text("%${widget.dogruSayisi * basariYuzdesi} Başarı",style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 211,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);                  },
                  child: Text("TEKRAR DENE",style: TextStyle(color: Colors.black,fontSize: 25),),
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
