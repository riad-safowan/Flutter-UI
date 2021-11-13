import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CardModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  var datas = [
    {"s": true, "t": "Full Stack"},
    {"s": false, "t": "Back End"},
    {"s": false, "t": "PING"}
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        print("menu clicked");
                      },
                      child: SvgPicture.asset("assets/icons/icon_2.svg")),
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/image_1.png'))),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Color(0xff0000000),
                        fontWeight: FontWeight.w500),
                  ),
                  Text('TroikaSoft',
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          color: Color(0xff0000000),
                          fontWeight: FontWeight.w700))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardData.length,
                  padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 16),
                      height: 200,
                      width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(cardData[index]["background"] as int)),
                      child: Stack(
                        children: [
                          Positioned(
                              child: SvgPicture.asset(
                                  cardData[index]["icon"] as String),
                              top: 16,
                              right: 16),
                          Positioned(
                              bottom: 16,
                              left: 16,
                              child: Text(
                                cardData[index]["position"] as String,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                          Positioned(
                              top: 25,
                              left: 25,
                              child: Text(
                                cardData[index]["user"] as String,
                                style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                          Positioned(
                              bottom: 16,
                              right: 16,
                              child: Text(
                                cardData[index]["cardNumber"] as String,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Operations"),
                  Row(
                    children: map<Widget>(datas, (index, selected) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == index
                                ? Colors.blue
                                : Colors.black26),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                  itemCount: datas.length,
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: OperationCard(
                          datas[index]["t"] as String, (index == current)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final bool isSelected;

  OperationCard(this.operation, this.isSelected) {}

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 120,
      height: 120,
      padding: EdgeInsets.only(top: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? Colors.blue : Colors.white,
      ),
      child: Column(
        children: [
          SvgPicture.asset(widget.isSelected
              ? "assets/icons/menu.svg"
              : "assets/icons/more.svg"),
          SizedBox(
            height: 16,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
