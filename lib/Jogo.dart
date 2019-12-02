import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class Bot {
  var _usrOpt;
  var _botOpt;
  var _winner;

  Bot(int option) {
    this._usrOpt = option;
    this._botOpt = new Random().nextInt(3);
    this._winner = this.winner();
  }

  int winner() {
    // _player 1 : empate
    // _player 2: usuário
    // _player 3: máquina
    int _player;

    if (this.botOpt == 0) { // Máquina colocou pedra
      switch(this.usrOpt) {
        case 0: // Usuário colocou pedra
          _player = 1; //empate
          break;
        case 1: // Usuário colocou papel
          _player = 2; // usuário ganhou
          break;
        case 2: // Usuário colocou tesoura
          _player = 3; // máquina ganhou
          break;
      }
    } else if (this.botOpt == 1) { // Máquina colocou papel
      switch(this.usrOpt) {
        case 0: // Usuário colocou pedra
          _player = 3; // máquina ganhou
          break;
        case 1: // Usuário colocou papel
          _player = 1; // empate
          break;
        case 2: // Usuário colocou tesoura
          _player = 2; // usuário ganhou
          break;
      }
    } else { // Máquina colocou tesoura
      switch(this.usrOpt) {
        case 0: // Usuário colocou pedra
          _player = 2; // usuário ganhou
          break;
        case 1: // Usuário colocou papel
          _player = 3; // máquina ganhou
          break;
        case 2: // Usuário colocou tesoura
          _player = 1; // empate
          break;
      }
    }

    return _player;
  }

  String result() {
    String _res;

    switch(this.win) {
      case 1:
        _res = 'Jogo empatou! Tente outra vez!';
        break;
      case 2:
        _res = 'Parabéns! Você venceu!!! :-)';
        break;
      case 3:
        _res = 'Dessa vez não deu! Continue tentando! :-(';
        break;
    }

    return _res;
  }

  int get win {
    return this._winner;
  }

  int get botOpt {
    return this._botOpt;
  }

  int get usrOpt {
    return this._usrOpt;
  }

}

class _JogoState extends State<Jogo> {
  var _imagensApp;
  var _idx = 0;
  var jogar;
  var _result = 'Clique em uma das opções abaixo:';

  @override
  Widget build(BuildContext context) {

    this._imagensApp = [
      AssetImage('images/padrao.png'),
      AssetImage('images/pedra.png'),
      AssetImage('images/papel.png'),
      AssetImage('images/tesoura.png')
    ];

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
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
             Text(
                  'Escolha do App',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Sansation',
                      fontWeight: FontWeight.w700
                  ),
               textAlign: TextAlign.center,
              ),
             Image(
               image: this._imagensApp[this._idx],
               height: 250,
             ),
             Padding(
               padding: EdgeInsets.all(30),
               child: Text(
                 this._result,
                 style: TextStyle(
                   fontSize: 30,
                   fontFamily: 'Sansation'
                 ),
                 textAlign: TextAlign.center,
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         jogar = new Bot(0);
                         this._idx = jogar.botOpt + 1;
                         this._result = jogar.result();
                       });

                     },

                     child: Image.asset(
                       'images/pedra.png',
                       height: 100,
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         jogar = new Bot(1);
                         this._idx = jogar.botOpt + 1;
                         this._result = jogar.result();
                       });
                     },

                     child: Image.asset(
                       'images/papel.png',
                       height: 100,
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         jogar = new Bot(2);
                         this._idx = jogar.botOpt + 1;
                         this._result = jogar.result();
                       });
                     },

                     child: Image.asset(
                       'images/tesoura.png',
                       height: 100,
                     ),
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
