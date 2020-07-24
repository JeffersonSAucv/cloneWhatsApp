import 'package:flutter/material.dart';

class CustomFloatingActionsButtons extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;

  const CustomFloatingActionsButtons({this.icon1, this.icon2});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Color(0xff3c3c3c),
          onPressed: () {},
          child: Icon(
            icon1,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          backgroundColor: Color(0xff00BFA5),
          onPressed: () {},
          child: Icon(
            icon2,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
