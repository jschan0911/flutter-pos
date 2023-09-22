import 'package:eunhyun_kiosk/paymentPage/MobileBody.dart';
import 'package:eunhyun_kiosk/paymentPage/TabletBody.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaymentBody extends StatefulWidget {
  final int price;
  const PaymentBody(this.price, {Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              // return TabletBody();
              return MobileBody(widget.price);
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return MobileBody(widget.price);
            }

            // return TabletBody();
            return MobileBody(widget.price);
          }
        ),
      ]
    );
  }
}
