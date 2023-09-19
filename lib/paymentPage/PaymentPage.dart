import 'package:eunhyun_kiosk/paymentPage/PaymentBody.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final int price;

  const PaymentPage(this.price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentBody(price),
    );
  }
}
