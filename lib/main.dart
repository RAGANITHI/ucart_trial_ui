import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ucart_trial_ui/grocery/screen/GrocerySignUp.dart';
import 'package:ucart_trial_ui/grocery/utils/GeoceryStrings.dart';
import 'package:ucart_trial_ui/grocery/utils/GroceryColors.dart';
import 'package:ucart_trial_ui/grocery/utils/GroceryConstant.dart';
import 'package:ucart_trial_ui/grocery/utils/GroceryExtension.dart';
import 'package:ucart_trial_ui/grocery/utils/GroceryImages.dart';
import 'package:ucart_trial_ui/grocery/utils/GroceryWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GrocerySplashScreen(),
    );
  }
}

class GrocerySplashScreen extends StatefulWidget {
  static String tag = '/GrocerySplashScreen';

  @override
  _GrocerySplashScreenState createState() => _GrocerySplashScreenState();
}

class _GrocerySplashScreenState extends State<GrocerySplashScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    setState(() {
//      GroceryDashBoardScreen().launch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_colorPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            grocery_ic_logo,
            width: width * 0.35,
            height: width * 0.35,
            fit: BoxFit.fill,
          ).center(),
          Padding(
            padding: const EdgeInsets.all(spacing_standard_new),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                text(grocery_lbl_Welcome_msg,
                        textColor: grocery_color_white,
                        fontSize: textSizeXXLarge,
                        fontFamily: fontSemiBold,
                        isCentered: true,
                        isLongText: true)
                    .paddingOnly(left: spacing_control, right: spacing_control),
                SizedBox(
                  height: spacing_xxLarge,
                ),
                Container(
                    width: width * 0.35,
                    child: groceryButton1(
                      textContent: grocery_lbl_Sign_In,
                      onPressed: (() {
                        GrocerySignUp(
                          isSignIn: true,
                          isSignUp: false,
                        ).launch(context);
                      }),
                    )),
                SizedBox(
                  height: spacing_standard,
                ),
                FittedBox(
                    child: groceryButton(
                  textContent: grocery_lbl_Sign_Up,
                  onPressed: (() {
                    GrocerySignUp(
                      isSignUp: true,
                      isSignIn: false,
                    ).launch(context);
                  }),
                ))
              ],
            ).paddingOnly(bottom: spacing_xxLarge),
          )
        ],
      ),
    );
  }
}
