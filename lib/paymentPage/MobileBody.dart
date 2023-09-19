import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MobileBody extends StatefulWidget {
  final int price;
  MobileBody(this.price, {Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  final currencyFormatter = NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    String formattedTotalPrice = currencyFormatter.format(widget.price);

    return Column(
        children: [
          Image.asset(
            'images/banner.png',
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  '결제 가격: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
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
          Image.asset(
            'images/payQR.jpg',
            width: MediaQuery
                .of(context)
                .size
                .width * 6 / 10,
          ),
          Text(
            '국민 01027116505',
            style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          NavigationButton(),
        ]
    );
  }

  Widget NavigationButton() {
    //Navigator.pushNamed(context, '/second');
    return InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(widget.totalPrice)));
          Navigator.pop(context);
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
            '되돌아가기',
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
