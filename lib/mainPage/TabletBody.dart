import 'package:flutter/material.dart';

class TabletBody extends StatefulWidget {
  TabletBody({Key? key}) : super(key: key);

  int totalPrice = 0;

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('태블릿 현재 가격: '),
            Text('${widget.totalPrice}'),
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
            DeleteButton()
          ],
        )
      ],
    );
  }
  Widget PriceButton(int price) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            widget.totalPrice += price;
          });
        },
        child: Text('$price')
    );
  }

  Widget DeleteButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.totalPrice = 0;
        });
      },
      child: const Text(
        'DEL',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
