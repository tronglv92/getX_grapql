import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_grapql_master/lang/translation_service.dart';
import 'package:get_grapql_master/routes/app_pages.dart';
import 'package:get_grapql_master/shared/utils/app_extension.dart';
import 'package:get_grapql_master/shared/utils/app_style.dart';
import 'package:get_grapql_master/shared/widgets/a_button_rounded_long.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // logger.d("Render Home Screen");
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
      ),
      body: Center(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.W),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.H,
            ),
            AButtonRoundedLong(
                child: Text(
                  'Query GraphQL',
                  style: txt14RegularRoboto(color: Colors.white),
                ),
                onPress: () {
                  Get.toNamed(AppRoutes.QUERY);
                }),
            SizedBox(
              height: 15.H,
            ),
            AButtonRoundedLong(
                child: Text(
                  'Mutation & Subscription GraphQL',
                  style: txt14RegularRoboto(color: Colors.white),
                ),
                onPress: () {

                }),

          ],
        ),
      )),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> list = [];
    TranslationService.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Text(key),
      ));
    });
    return list;
  }
}
