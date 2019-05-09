import 'package:flutter/material.dart';
import 'package:flutter_trip_app/entity/NavbarEntity.dart';

Widget buildNavbar(BuildContext context, {List<NavbarEntity> navbars}) {
  Container getItemColumn(NavbarEntity navbar, index) {
    return new Container(
      margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 35.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Image(
            width: 30,
            height: 30,
            image: NetworkImage(navbar.image),
            fit: BoxFit.cover,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: new Text(
              navbar.name,
              style: new TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }

  return new Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    // width: MediaQuery.of(context).size.width - 100,
    height: 90,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border: new Border.all(
        width: 1.0,
        color: Colors.transparent,
      ),
      borderRadius: new BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 5.0,
        ),
      ],
    ),
    child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: new List<Container>.generate(navbars.length,
              (int index) => getItemColumn(navbars[index], index)),
        )
      ],
    ),
  );
}
