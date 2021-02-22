import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  
  void _opcaoSelecionada(String escolhaUsuario){

    var _opcoes = ["pedra", "papel", "tesoura",];
    var numero = Random().nextInt(3);
    var escolhaApp = _opcoes[numero];

    print("Escolha do App: $escolhaApp");
    print("Escolha do usuário: $escolhaUsuario");
    
    switch (escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

  if (
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
    (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "papel")
  ){
    setState(() {
      _mensagem = "Você ganhou!";
    });
  } else if (
    (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
    (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "pedra")
  ){
    setState(() {
      _mensagem = "Você perdeu!";
    });
  } else {
    setState(() {
      _mensagem = "A rodada empatou!";
    });
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("JokenPô")
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(
                image: this._imagemApp,
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  this._mensagem,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset(
                        "images/pedra.png",
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset(
                      "images/papel.png",
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset(
                      "images/tesoura.png",
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
