import 'package:flutter/material.dart';
import 'package:movity_app/constants/constants.dart';

class BuyButton extends StatefulWidget {
  final String movieName;

  BuyButton(this.movieName);

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
        child: FlatButton(
          color: secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          onPressed: null,
          child: Text(
            'Buy Ticket',
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
