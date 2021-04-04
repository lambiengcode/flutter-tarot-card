import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data/tarot_json.dart';
import 'package:flutter_getx_template/src/public/constant.dart';
import 'package:flutter_getx_template/src/public/styles.dart';
import 'package:flutter_getx_template/src/routes/app_pages.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();

  DateFormat format = DateFormat('dd/MM');
  List<bool> flips = [false, false, false, false];
  List tarots = [];
  List unLockCard = [];

  @override
  void initState() {
    super.initState();
    tarots.addAll(tarotData);
    unLockCard.addAll(tarotData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlack,
        elevation: .0,
        centerTitle: true,
        title: Text(
          'today'.trArgs() + ' ' + format.format(DateTime.now()),
          style: TextStyle(
            color: mCL,
            fontFamily: 'Lato',
            fontSize: width / 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (Get.locale == Locale('vi', 'VN')) {
                Get.updateLocale(Locale('en', 'US'));
              } else {
                Get.updateLocale(Locale('vi', 'VN'));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              margin: EdgeInsets.symmetric(vertical: 1.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                Get.locale == Locale('vi', 'VN') ? 'vi' : 'en',
                style: TextStyle(
                  color: colorPrimary,
                  fontFamily: 'Lato',
                  fontSize: width / 22.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: Container(
        color: colorBlack,
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12.0),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTarotCard(cardKey1, 0, 'overview'.trArgs()),
                      SizedBox(width: 16.0),
                      _buildTarotCard(cardKey2, 1, 'work'.trArgs()),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTarotCard(cardKey3, 2, 'love'.trArgs()),
                      SizedBox(width: 16.0),
                      _buildTarotCard(cardKey4, 3, 'finance'.trArgs()),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  flips.contains(false)
                      ? Container()
                      : NeumorphicButton(
                          onPressed: () => Get.toNamed(Routes.DETAILS,
                              arguments: unLockCard.sublist(0, 4)),
                          margin: EdgeInsets.symmetric(horizontal: 48.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'solveCards'.trArgs(),
                                style: TextStyle(
                                  color: colorPrimary,
                                  fontFamily: 'Lato',
                                  fontSize: width / 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Icon(
                                Feather.arrow_right,
                                size: width / 24.0,
                                color: colorPrimary,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(width / 32.0),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.convex,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12.0),
                            ),
                            depth: 15.0,
                            intensity: .15,
                            color: Colors.black.withOpacity(.75),
                          ),
                          duration: Duration(milliseconds: 200),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTarotCard(key, number, title) {
    return Column(
      children: [
        FlipCard(
          key: key,
          flipOnTouch: false,
          front: GestureDetector(
            onTap: () {
              tarots.shuffle();
              key.currentState.toggleCard();
              setState(() {
                flips[number] = true;
              });
              unLockCard[number] = tarots[0];
              tarots.removeAt(0);
            },
            child: Container(
              height: height * .32,
              width: width * .4,
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
              height: height * .32,
              width: width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: colorBackground,
                image: DecorationImage(
                  image: AssetImage(unLockCard.length < number + 1
                      ? 'images/${tarots[number]['img']}'
                      : 'images/${unLockCard[number]['img']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          flips[number] == true ? unLockCard[number]['name'] : title,
          style: TextStyle(
            fontSize: width / 24.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lato',
            letterSpacing: 1.5,
            wordSpacing: 1.5,
            color: mC,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
