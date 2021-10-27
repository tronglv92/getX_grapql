import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_grapql_master/shared/constants/colors.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'my_app.dart';



void main() async{



  //
  // runApp(app);
  await myMain();
  configLoading();
}


void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.doubleBounce
    ..loadingStyle = EasyLoadingStyle.custom
  // ..indicatorSize = 45.0
    ..radius = 10.0
  // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
  // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}

