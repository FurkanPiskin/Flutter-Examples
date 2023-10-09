import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin/TahminEkrani.dart';
import 'package:sayi_tahmin/main.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;

   SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {


  String mutluresim="mutlu.jpg";
  String uzgunresim="üzgün.jgp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("SonucEkrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

             Image.asset(widget.sonuc?"lib/Resimler/$mutluresim":"lib/Resimler/$uzgunresim"),
            Text(widget.sonuc?"Kazandınız":"Kaybettiniz",style: TextStyle(color: Colors.black54,fontSize: 36),),


            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Oyna"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
