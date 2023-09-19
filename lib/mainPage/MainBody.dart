import 'package:eunhyun_kiosk/mainPage/MobileBody.dart';
import 'package:eunhyun_kiosk/mainPage/TabletBody.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                return TabletBody();
              }

              if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
                return MobileBody();
              }

              return TabletBody();
            }
        ),
      ]
    );
  }
}
