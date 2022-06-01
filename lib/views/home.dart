import 'dart:math';

import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "Aguardando escolha do jogador...";
  String _imagemMaquina = "images/jogar.jpg";
  List<String> imagens = [
    "images/pedra.jpg",
    "images/papel.jpg",
    "images/tesoura.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel e Tesoura"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade700,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(_imagemMaquina, width: 240, height: 240),
            const Text("Faça sua escolha", textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => jogo(0),
                  child:
                      Image.asset("images/pedra.jpg", width: 240, height: 240),
                ),
                GestureDetector(
                  onTap: () => jogo(1),
                  child:
                      Image.asset("images/papel.jpg", width: 240, height: 240),
                ),
                GestureDetector(
                  onTap: () => jogo(2),
                  child: Image.asset("images/tesoura.png",
                      width: 240, height: 240),
                ),
              ],
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }

  void jogo(int usuario) {
    int maquina = Random().nextInt(3);
    int us = usuario;
    String ganhador = '';

    switch (maquina) {
      case 0:
        {
          if (us == 0) {
            ganhador = 'Empate';
          } else if (us == 1) {
            ganhador = 'O jogador venceu!';
          } else {
            ganhador = 'A máquina venceu!';
          }
        }
        break;

      case 1:
        {
          if (us == 0) {
            ganhador = 'A máquina venceu!';
          } else if (us == 1) {
            ganhador = 'Empate';
          } else {
            ganhador = 'O jogador venceu!';
          }
        }
        break;

      default:
        {
          if (us == 0) {
            ganhador = 'O jogador venceu!';
          } else if (us == 1) {
            ganhador = 'A máquina venceu!';
          } else {
            ganhador = 'Empate';
          }
        }
        break;
    }

    setState(() {
      _resultado = ganhador;
      _imagemMaquina = imagens[maquina];
    });
  }
}
