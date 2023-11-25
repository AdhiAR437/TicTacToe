import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/cusmdialg.dart';
import 'package:tictactoe/gamebut.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  List <GameButtn> butnslist;
  var playera;
  var playerb;
  var activplaer;

  @override
  void initState(){
      super.initState();
      butnslist = dointn();
    }
    void playgae(GameButtn g)
    {
        setState(() {
         if(activplaer==1){
           g.text="X";
           g.bg= Colors.red;
           activplaer=2;
           playera.add(g.id);
         }else{
           g.text="0";
           g.bg= Colors.blueAccent;
           activplaer=1;
           playerb.add(g.id);
         }
         g.enabled= false;
         var winner= iswinner();
       if(winner!=1)
         {
           if(butnslist.every((p) =>p.text!=" ")){
             showDialog(context: context, builder:(_)=> new cusdi("Game Tied",resetgme,"Press the button to restart the game from first"));
           }else
             {
               activplaer==2?autopy():null;
             }
         }

        });
    }
    void autopy(){
    var emotycells= new List();
    var list= new List.generate(9, (i) =>i+1);
    for(var cellid in list){
      if(!playerb.contains(cellid)||playera.contains(cellid))
        {emotycells.add(cellid);}
    }
    var r = new Random();
    var ranind= r.nextInt(emotycells.length-1);
    var cellid= emotycells[ranind];
   var i =butnslist.indexWhere((p) =>p.id==cellid);
   playgae(butnslist[i]);
  }
   int iswinner(){
    var winner=-1;
    if(playera.contains(1)&& playera.contains(2)&& playera.contains(3)) winner=1;
    else if (playera.contains(4)&& playera.contains(5)&& playera.contains(6)) {winner=1;}
    else if (playera.contains(7)&& playera.contains(8)&& playera.contains(9)) {winner=1;}
    else if (playera.contains(1)&& playera.contains(5)&& playera.contains(9)) { winner=1;}
    else if (playera.contains(3)&& playera.contains(5)&& playera.contains(7)) {winner=1;}
    else if (playerb.contains(1)&& playerb.contains(2)&& playerb.contains(3)) {winner=2;}
    else if (playerb.contains(4)&& playerb.contains(5)&& playerb.contains(6)) {winner=2;}
    else if (playerb.contains(7)&& playerb.contains(8)&& playerb.contains(9)) {winner=2;}
    else if (playerb.contains(1)&& playerb.contains(5)&& playerb.contains(9)) {winner=2;}
    else if (playerb.contains(3)&& playerb.contains(5)&& playerb.contains(7)) {winner=2;}
    if(winner!=-1)
      {
        if( winner==1)
              {
               showDialog(context: context,
               builder: (_)=> new cusdi("Player 1 won", resetgme, "Press to start again"));
              }
        else if(winner==2)
          {
            showDialog(context: context,
                builder: (_)=> new cusdi("Player 2 won", resetgme, "Press to start again"));
          }
      }

  }
  void resetgme(){
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      butnslist= dointn();
    });
  }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text('TictacToe'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 9),
                padding: const EdgeInsets.all(10),
                itemCount: butnslist.length,
                itemBuilder: (context, i) =>
                new SizedBox
                  (width: 100,
                    height: 100,
                    child: ElevatedButton(onPressed: butnslist[i].enabled?()=>playgae(butnslist[i]):null,
                        child: new Text(butnslist[i].text,
                          style: new TextStyle(
                              fontSize: 20, color: Colors.deepOrangeAccent),),
                        style: ElevatedButton.styleFrom(primary: Colors.amberAccent))

                ),
              ),
            ),
            new RaisedButton(child: Text("REset"),padding: const EdgeInsets.all(10),onPressed: resetgme,)
          ],
        ),
      );
    }

    List<GameButtn> dointn() {
    playera=playerb= new List.empty(growable: true);
    activplaer=1;

      var gmebt = <GameButtn>[new GameButtn(id: 1),
        new GameButtn(id: 2),
        new GameButtn(id: 3),
        new GameButtn(id: 4),
        new GameButtn(id: 5),
        new GameButtn(id: 6),
        new GameButtn(id: 7),
        new GameButtn(id: 8),
        new GameButtn(id: 9)

      ];
      return gmebt;
    }
  }
