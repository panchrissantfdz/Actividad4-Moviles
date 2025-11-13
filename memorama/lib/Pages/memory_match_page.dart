import 'dart:async';
import 'package:flutter/material.dart';

import '../Models/game.dart';
import '../Widgets/game_button.dart';
import '../Widgets/game_timer.dart';
import '../Widgets/memory_card.dart';



class MemoryMatchPage extends StatefulWidget{
  const MemoryMatchPage({
    super.key,
  });

  State<MemoryMatchPage> createState() => _MemoryMatchPageState();
}

class _MemoryMatchPageState extends State<MemoryMatchPage>{
  Timer? timer;
  Game? game;

  @override
  void initState(){
    super.initState();
    game = Game(4);
    startTimer();
  }

  startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (t){
      setState(() {
        game!.time = game!.time + 1;
      });
      if(game!.isGameOver){
        timer!.cancel();
      }
    });
  }

  void _resetGame(){
    game!.resetGame();
    setState(() {
      timer!.cancel();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MemoryMatch'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: GameTimer(
                      time: game!.time
                  ),
              ),
              Expanded(
                  flex: 3,
                  child: GridView.count(
                      crossAxisCount: game!.gridSize,
                      children: List.generate(game!.cards.length, (index) {
                      return MemoryCard(
                          cardItem: game!.cards[index],
                          index: index,
                          onCardPressed: game!.onCardPressed);
                      }),
                  ),
              ),
              if(game!.isGameOver)
                Expanded(
                  flex: 1,
                  child: GameButton(title: 'Intenta de Nuevo :(', onPressed: () => _resetGame()),
                )
              else
                const Expanded(
                    flex: 1,
                    child: SizedBox()
                )
            ],
          )
      ),
    );
  }


}
