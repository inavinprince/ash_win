import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';

import 'game_logic.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PlayGround> {
  String activePlayer = 'aashwin';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwitched = false;

  //  Lottie.asset('images/squidgame.json'),  // use lottie example

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  ...firtBlock(),
                  _expanded(context),
                  ...lastBlock(),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...firtBlock(),
                        const SizedBox(height: 20),
                        ...lastBlock(),
                      ],
                    ),
                  ),
                  _expanded(context),
                ],
              ),
      ),
    );
  }

  List<Widget> firtBlock() {
    return [
      SwitchListTile.adaptive(
        title: Text(
          'Mode',
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          textAlign: TextAlign.end,
        ),
        value: isSwitched,
        onChanged: (bool newValue) {
          setState(() {
            isSwitched = newValue;
          });
        },
      ),
      Text(
        'It\'s $activePlayer turn'.toUpperCase(),
        style: GoogleFonts.roboto(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> lastBlock() {
    return [
      Text(
        result,
        style: GoogleFonts.roboto(
            fontSize: 42, fontWeight: FontWeight.w600, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: (() {
                Dialogs.materialDialog(
                  color: Colors.white,
                  msg: 'Welcome to aashwin territory ',
                  lottieBuilder: Lottie.asset(
                    'images/squidgame.json',
                    fit: BoxFit.fill,
                  ),
                  context: context,
                  actions: [],
                );
              }),
              child: Text('Danger Zone')),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Player.playerX = [];
                Player.playerO = [];
                activePlayer = 'X';
                gameOver = false;
                turn = 0;
                result = '';
              });
            },
            icon: const Icon(Icons.gamepad_rounded),
            label: const Text('Play Again'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).splashColor),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
    ];
  }

  Widget _expanded(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.0,
        crossAxisCount: 3,
        children: List.generate(
            9,
            (index) => InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: gameOver ? null : () => _onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        Player.playerX.contains(index)
                            ? 'X'
                            : Player.playerO.contains(index)
                                ? 'O'
                                : '',
                        style: TextStyle(
                          color: Player.playerX.contains(index)
                              ? Colors.white
                              : Colors.redAccent,
                          fontSize: 52,
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  _onTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();

      if (!isSwitched && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;

      String winnerPlayer = game.checkWinner();

      if (winnerPlayer != '') {
        gameOver = true;
        result = '$winnerPlayer is the winner';
      } else if (!gameOver && turn == 9) {
        result = 'It\'s Draw!';
      }
    });
  }
}
