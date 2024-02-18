import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{
  static final String veritabaniAdi = "bayrakquiz.sqlite";

  static Future<Database> veritabaniErisim() async{
    var veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if(await databaseExists(veritabaniYolu)){

      print("Veritabanı daha önceden kopyalanmış.");
    }else{
      // Assetten veritabanının alınması
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      // Veritabanının kopyalama için byte dönüşümü
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      // Veritabanı kopyalanması
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
    }

    return openDatabase(veritabaniYolu);
  }
}