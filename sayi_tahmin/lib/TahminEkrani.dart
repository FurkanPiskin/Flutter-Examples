import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin=TextEditingController();
  int rastgele=0;
  int kalanhak=5;
  String yonlendirme="";
  @override
  void initState() {
    super.initState();
    rastgele=Random().nextInt(101);//0-100
    print("Rastgele Sayi:$rastgele");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Tahmin Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Kalan hak:$kalanhak",style: TextStyle(color:Colors.pink,fontSize: 30),),
            Text("Yardım :$yonlendirme",style: TextStyle(color:Colors.pink,fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tahmin Et"),
                onPressed: (){
                  setState(() {
                    kalanhak=kalanhak-1;

                  });
                  int tahmin=int.parse(tfTahmin.text);
                  if(tahmin==rastgele){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>SonucEkrani(sonuc: true,)));
                    return;//Butonun çalışmasını burada durdurur.
                  }
                  if(tahmin>rastgele){
                    setState(() {
                      yonlendirme="Tahmini azalt";
                    });
                  }
                  if(tahmin<rastgele){
                    setState(() {
                      yonlendirme="Tahmini arttır";
                    });
                  }
                  if(kalanhak==0){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>SonucEkrani(sonuc:false,)));
                  }
                  tfTahmin.text="";
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
