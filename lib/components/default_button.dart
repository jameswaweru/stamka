import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.height
  }) : super(key: key);
  final String text;
  final Function press;
  final double height;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: press,
        child: Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent[400]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
      ),
    );

    // return SizedBox(
    //   width: double.infinity,
    //   height: getProportionateScreenHeight(56),
    //   child: FlatButton(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //     color: kPrimaryColor,
    //     onPressed: press,
    //     child: Text(
    //       text,
    //       style: TextStyle(
    //         fontSize: getProportionateScreenWidth(18),
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // );
  }
}