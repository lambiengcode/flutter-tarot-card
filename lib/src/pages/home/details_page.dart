import 'package:flutter/material.dart';
import 'package:flutter_getx_template/src/public/constant.dart';
import 'package:flutter_getx_template/src/public/styles.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class DetailsPage extends StatefulWidget {
  final results;
  DetailsPage({this.results});
  @override
  State<StatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final translator = GoogleTranslator();

  var value1;
  var value2;
  var value3;
  var value4;
  bool loading = true;

  void initContent() async {
    value1 = await translator.translate(
      widget.results[0]['meanings']['light'].join('\n\n'),
      to: 'vi',
    );
    value2 = await translator.translate(
      widget.results[1]['meanings']['light'].join('\n\n'),
      to: 'vi',
    );
    value3 = await translator.translate(
      widget.results[2]['meanings']['light'].join('\n\n'),
      to: 'vi',
    );
    value4 = await translator
        .translate(
      widget.results[3]['meanings']['light'].join('\n\n'),
      to: 'vi',
    )
        .then((result) {
      setState(() {
        loading = false;
      });
      return result;
    });
  }

  @override
  void initState() {
    super.initState();
    initContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlack,
        elevation: 4.0,
        centerTitle: true,
        title: Text(
          'solveCards'.trArgs(),
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
      body: loading
          ? Container(
              color: colorBlack,
              height: height,
              width: width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              color: colorBlack,
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    _buildTitle('overview'.trArgs(), widget.results[0]['name']),
                    SizedBox(height: 16.0),
                    Get.locale == Locale('vi', 'VN')
                        ? _buildContentTranslate(value1)
                        : _buildContent(widget.results[0]['meanings']['light']),
                    SizedBox(height: 16.0),
                    _buildTitle('work'.trArgs(), widget.results[1]['name']),
                    SizedBox(height: 16.0),
                    Get.locale == Locale('vi', 'VN')
                        ? _buildContentTranslate(value2)
                        : _buildContent(widget.results[1]['meanings']['light']),
                    SizedBox(height: 16.0),
                    _buildTitle('love'.trArgs(), widget.results[2]['name']),
                    SizedBox(height: 16.0),
                    Get.locale == Locale('vi', 'VN')
                        ? _buildContentTranslate(value3)
                        : _buildContent(widget.results[2]['meanings']['light']),
                    SizedBox(height: 16.0),
                    _buildTitle('finance'.trArgs(), widget.results[3]['name']),
                    SizedBox(height: 16.0),
                    Get.locale == Locale('vi', 'VN')
                        ? _buildContentTranslate(value4)
                        : _buildContent(widget.results[3]['meanings']['light']),
                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTitle(title, value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title + ':\t\t',
            style: TextStyle(
              color: colorPrimary,
              fontFamily: 'Lato',
              fontSize: width / 22.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: mCL,
              fontFamily: 'Lato',
              fontSize: width / 23.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(List content) {
    return Text(
      content.join('\n\n'),
      style: TextStyle(
        color: mCL,
        fontFamily: 'Lato',
        fontSize: width / 25.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildContentTranslate(future) {
    return Text(
      future.toString(),
      style: TextStyle(
        color: mCL,
        fontFamily: 'Lato',
        fontSize: width / 25.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
