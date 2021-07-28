import 'package:flutter/material.dart';
import 'package:nutrition_app/blurimage/blurimage.dart';
import 'package:nutrition_app/chachedImage/chachedImage.dart';
import 'package:nutrition_app/detailPage.dart';
import 'package:nutrition_app/discount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: chachedImage(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                Container(
                  width: 100,
                  margin: EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Row(children: [
              Text(
                "Healthy",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 13),
              Text(
                "Food",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
          SizedBox(height: 50),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  buildTileList(
                      "assets/images/img.jpg", "Salman bowl", "24.00"),
                  buildTileList(
                      "assets/images/img1.jpg", "Spring bowl", "22.00"),
                  buildTileList(
                      "assets/images/img2.jpg", "Spring bowl", "26.00"),
                  buildTileList(
                      "assets/images/img3.jpg", "Spring bowl", "24.00"),
                  buildTileList(
                      "assets/images/img4.jpg", "Spring bowl", "30.00"),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0),
                    color: Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCustomButton1(),
                        buildCustomButton2(),
                        buildCustomButton3(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildCustomButton3() {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300],
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  buildCustomButton2() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300],
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("5"),
              SizedBox(width: 5),
            ],
          ),
          SizedBox(width: 5),
          Icon(
            Icons.shopping_basket_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  buildCustomButton1() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300],
          width: 2,
        ),
      ),
      child: Center(
          child: Icon(
        Icons.search,
      )),
    );
  }

  buildTileList(imgPath, name, price) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 40, top: 20),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        desc: name,
                        prices: price,
                        imagePath: imgPath,
                      )),
            );
          },
          child: Row(
            children: [
              Hero(
                tag: imgPath,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imgPath),
                ),
              ),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("\$$price",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ))
                ],
              ),
              Spacer(),
              Icon(
                Icons.add,
                color: Colors.black,
              ),
              SizedBox(width: 40),
            ],
          ),
        ));
  }
}
