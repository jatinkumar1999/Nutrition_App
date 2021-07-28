import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  Discount({Key key}) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildList(),
          ],
        ),
      ),
    ));
  }

  buildList() {
    return Container(
      width: 200,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            left: 45,
            top: 0,
            child: Container(
              width: 20,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.red[600],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 300,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/img.jpg",
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 0,
            child: Container(
                width: 20,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  "85 \%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
