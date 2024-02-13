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
      appBar: AppBar(
        title: Text("Sonuc Ekranı"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.dogruSayisi} DOĞRU ${tumSorular - widget.dogruSayisi} YANLIŞ"),

            Text("${widget.dogruSayisi * basariYuzdesi} Başarı"),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text("TEKRAR DENE"))
          ],
        ),
      ),
    );
  }
}
