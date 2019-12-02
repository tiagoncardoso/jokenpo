import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Joken Pô",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.yellow,
            width: 2
          )
        ),
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
             Text(
                  'Escolha do App',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                  ),
               textAlign: TextAlign.center,
              ),
             Image.asset(
                 'images/pedra.png'
             ),
             Padding(
               padding: EdgeInsets.all(60),
               child: Text(
                 'Você perdeu :-(',
                 style: TextStyle(
                   fontSize: 30,
                   fontFamily: 'Sansation',
                   fontWeight: FontWeight.w700
                 ),
                 textAlign: TextAlign.center,
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   OutlineButton(
                       onPressed: null,
                       borderSide: BorderSide(
                         color: Colors.red,
                         style: BorderStyle.solid,
                         width: 3
                       ),
                       shape: CircleBorder(),
                       padding: EdgeInsets.all(15),
                       child: Image.asset('images/pedra.png')
                   ),
                   OutlineButton(
                       onPressed: null,
                       borderSide: BorderSide(
                         style: BorderStyle.solid,
                           width: 3,
                           color: Colors.red
                       ),
                       shape: CircleBorder(),
                       padding: EdgeInsets.all(15),
                       child: Image.asset('images/papel.png')
                   ),
                   OutlineButton(
                       onPressed: null,
                       borderSide: BorderSide(
                         color: Colors.red,
                         style: BorderStyle.solid,
                         width: 3
                       ),
                       shape: CircleBorder(),
                       padding: EdgeInsets.all(15),
                       child: Image.asset('images/tesoura.png')
                   ),
                 ],
               ),
             )
          ],
        ),
      )
    );
  }
}
