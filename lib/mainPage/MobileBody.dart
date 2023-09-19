import 'package:eunhyun_kiosk/paymentPage/PaymentPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MobileBody extends StatefulWidget {
  MobileBody({Key? key}) : super(key: key);

  int totalPrice = 0;

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  final currencyFormatter = NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    String formattedTotalPrice = currencyFormatter.format(widget.totalPrice);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/banner.png',
          width: MediaQuery.of(context).size.width,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100, bottom: 100),
              child: Text(
                '현재 가격: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 100),
              child: Text(
                '$formattedTotalPrice 원',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.green
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PriceButton(1000),
            PriceButton(2000),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PriceButton(3000),
            PriceButton(5000),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PriceButton(500),
            DeleteButton()
          ],
        ),
        Row(
          children: [
            NavigationButton()
          ],
        )
      ],
    );
  }
  Widget PriceButton(int price) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.totalPrice += price;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2 - 10,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Text(
          '$price',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  Widget DeleteButton() {
    return InkWell(
      onTap: () {
        setState(() {
          widget.totalPrice = 0;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2 - 10,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(5)
        ),
        child: const Text(
          'DEL',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  Widget NavigationButton() {
    //Navigator.pushNamed(context, '/second');
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(widget.totalPrice)))
              .then((value){
                setState(() {
                  widget.totalPrice = 0;
                });
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5)
          ),
          child: const Text(
            '계산하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
        )
    );
  }
}
