import 'package:flag_quiz_app/Bayraklar.dart';
import 'package:flag_quiz_app/VeritabaniYardimcisi.dart';

class BayraklarDAO{

  Future<List<Bayraklar>> dogruSecenek5Bayrak() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (i) {

      var satir = maps[i];

      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

  Future<List<Bayraklar>> yanlisSecenek3Bayrak(int bayrak_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id !=$bayrak_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i) {

      var satir = maps[i];

      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }
}