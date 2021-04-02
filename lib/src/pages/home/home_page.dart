import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data/tarot_json.dart';
import 'package:flutter_getx_template/src/public/styles.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../public/constant.dart';
import '../../public/styles.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  DateFormat format = DateFormat('dd/MM');
  bool flip = false;
  List tarots = [];

  @override
  void initState() {
    super.initState();
    tarots.addAll(tarotData);
    tarots.shuffle();
    print(tarots[0]['img']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorBlack,
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height / 16.0),
            Text(
              'Welcome Tarot Witch\nToday is ${format.format(DateTime.now())}',
              style: TextStyle(
                fontSize: width / 14.5,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
                letterSpacing: 1.5,
                wordSpacing: 1.5,
                color: mC,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlipCard(
                    key: cardKey,
                    flipOnTouch: false,
                    front: GestureDetector(
                      onTap: () {
                        cardKey.currentState.toggleCard();
                        setState(() {
                          flip = true;
                        });
                      },
                      child: Container(
                        height: height * .6,
                        width: width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: colorBackground,
                        ),
                        child: Lottie.asset('assets/lottie/lottie_card.json'),
                      ),
                    ),
                    back: GestureDetector(
                      onTap: () => null,
                      child: Container(
                        height: height * .6,
                        width: width * .75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: colorBackground,
                          image: DecorationImage(
                            image: AssetImage('images/${tarots[0]['img']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              flip == true ? tarots[0]['name'] : '',
              style: TextStyle(
                fontSize: width / 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato',
                letterSpacing: 1.5,
                wordSpacing: 1.5,
                color: mC,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
