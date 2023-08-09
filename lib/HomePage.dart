import 'dart:async';
import 'ball.dart';
import 'package:action/ball.dart';
import 'package:action/buttons.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
enum direction {LEFT,RIGHT}
class _HomePageState extends State<HomePage> {
  double xaxis=0;
  int level=1;
  int x=1;
  double u=0;
  int yui=0;

  int score=0,r=0;
  double mx=0,my=1.1;
  double ballx=0,bally=0;
  String sre='',mnb='START THE GAME ON PRESSING THE MISSILE ';
  var balldirection=direction.LEFT;
  void moveLeft() {
    setState(() {
      if(xaxis>-0.9){
        xaxis-=0.1;
      }
      else{
      }
    });
  }
  void ballmove(){

    setState(() {

    if(mx>0.25){
      ballx=-1+mx;
      balldirection=direction.LEFT;
    }
    else if(mx<-0.25){
      ballx=1+mx;
      balldirection=direction.RIGHT;
    }
    else{
      if(r%2==0){
        ballx=0.8;balldirection=direction.LEFT;
      }
      else{
        ballx=-0.8;balldirection=direction.RIGHT;
      }
    }
    if(r%6==0){
      balldirection=direction.LEFT;
      bally=((r%10))/10-0.1;
    }
    else if(r%6==1){
      balldirection=direction.LEFT;
      bally=-((r%10))/10;
    }
    else if(r%6==2){
      balldirection=direction.RIGHT;
      bally=-((r%10))/10;
    }
    else if(r%6==3){
      balldirection=direction.LEFT;
      bally=((r%10))/10-0.1;
    }
    else if(r%6==4){
      balldirection=direction.LEFT;
      bally=((r%10))/10-0.1;
    }
    else if(r%6==5){
      balldirection=direction.RIGHT;
      bally=-((r%10))/10;
    }


  });
    Timer.periodic(Duration(milliseconds: 50),(timer2){
      setState(() {
        if(balldirection==direction.LEFT){
          if(ballx<-0.9){
            balldirection=direction.RIGHT;
          }
          else{
            ballx-=0.01;
          }
        }
        else if(balldirection==direction.RIGHT){
          if(ballx>0.9){
            balldirection=direction.LEFT;
          }
          else{
            ballx+=0.01;
          }
        }
      });

    });



  }
  void reset(){
    setState(() {

      //_timer.cancel();
      //_timer2.cancel();
      xaxis=0;
      ballx=0;
      bally=0;
      score=0;
      x+=10;

    });
  }
  void moveRight() {
    setState(() {
      if(xaxis<0.9){
        xaxis+=0.1;
      }
      else{
      }

    });
  }
  void messile() {
    if(bally<1){
sre='';
    }
    setState(() {mnb='';
      mx=xaxis;my=1.1;
    });

    Timer.periodic(Duration(milliseconds: 20),(timer1){
      setState(() {if(bally<1){
        if ((my - bally).abs() < 0.08) {
          if ((ballx - mx).abs() < 0.08) {
            score++;
            r++;
            ballmove();
          } else {
            my -= 0.01;
          }
        }
        u++;
        if (u / 100 > 1) {
          u = 0;
          if (bally > 0) {
            bally += 0.05;
          }
          else {
            bally += 0.1;
          }
        }
        if (bally - 2 > my) {
          timer1.cancel();
        }
        if (bally > 1) {
          level++;
          sre = 'YOU ARE DEAD WITH SCORE $score PRESS THE "REPLAY" ICON TO RESTART';
          timer1.cancel();

        }
        else {
          my -= 0.01;
        }
      } });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(

          flex: 3,
          child: Container(
          color: Colors.black45,
            child: Center(
              child: Stack(
                children: [
                  Ball(
                    ballx : ballx,
                    bally : bally,
                  ),
                Container(
                  alignment: Alignment(0,0),
                  child: Container(


                    child: Padding(
                      padding: const EdgeInsets.only(left :15.0),
                      child: Center(child: Text('$sre$mnb',
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Myutton(
                          icon : Icons.replay,
                          function: reset,

                        ),
                        Container(
                          color: Color(0xFF381460),

                          height: 40,
                          child: Text('SCORE: $score',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment(xaxis,1),
                    child: Container(
                        height: 50,
                        width: 50,
                        child :Center(child: Icon(
                          Icons.airplanemode_active,
                          color: Colors.yellowAccent,
                          size: 50,))
                    ),

                  ),
                  Container(
                    alignment: Alignment(mx,my),
                    child: Container(
                      height: 40,
                      width: 6,
                      color: Colors.red,
                    ),
                  )
                ],

              ),
            ),

        ),),
        Expanded(child: Container(
          color: Colors.brown,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Myutton(
                icon : Icons.arrow_left,
                function: moveLeft,

              ),
              Myutton(
                icon : Icons.rocket,
                function: messile,

              ),
              Myutton(
                icon : Icons.arrow_right,
                function: moveRight,

              ),
            ],
          ),

        ))
      ],
    );
  }
}
