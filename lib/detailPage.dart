import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imagePath, desc, prices;
  DetailPage({Key key, this.imagePath, this.desc, this.prices})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var selectedcard = "WEIGHT";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[300],
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: Text("Details",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_horiz_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 110),
                height: MediaQuery.of(context).size.height - 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
              ),
              Column(
                children: [
                  Hero(
                    tag: widget.imagePath,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 60,
                        left: (MediaQuery.of(context).size.width / 2) - 150,
                      ),
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(130),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.imagePath),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 100,
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                child: Text(widget.desc,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                    ))),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$ ${widget.prices}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 25,
                              width: 2,
                              color: Colors.grey[300],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 35,
                                  width: 100,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 30,
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo[300],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                            child: Text("2",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                            color: Colors.indigo[300],
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCards("WEIGHT", "235", "C"),
                        buildCards("CALCIUM", "267", "CAL"),
                        buildCards("VITMINS", "A,B6", "VIT"),
                        buildCards("NUTRITION", "300", "NUT"),
                      ],
                    ),
                  ),
                  buyButton(widget.prices),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  buyButton(buy) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Text(
        "\$$buy",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  buildCards(String title, info, units) {
    return InkWell(
      onTap: () {
        selectedCard(title);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        height: 120,
        width: 110,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: switchCardColor(title),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: switchCardBorderColor(title),
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: switchCardTextColor(title),
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info,
                  style: TextStyle(
                    color: switchCardTextColor(title),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  units,
                  style: TextStyle(
                    color: switchCardTextColor(title),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  selectedCard(tittle) {
    setState(() {
      selectedcard = tittle;
    });
  }

  switchCardColor(tittle) {
    if (selectedcard == tittle) {
      return Colors.indigo[300];
    } else {
      return Colors.white;
    }
  }

  switchCardBorderColor(tittle) {
    if (selectedcard == tittle) {
      return Colors.indigo[300];
    } else {
      return Colors.grey[300];
    }
  }

  switchCardTextColor(tittle) {
    if (selectedcard == tittle) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
