import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stamka/screens/transaction_receipt.dart';

import '../size_config.dart';

class ServiceCard extends StatelessWidget {

  final String serviceImage;
  final Function press;
  ServiceCard({this.serviceImage , this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: InkWell(
        onTap: press,
        // onTap: (){
        //   Navigator.push(
        //       context,
        //       PageTransition(
        //           duration: Duration(milliseconds: 600),
        //           type: PageTransitionType.fade,
        //           child: TransactionReceipt()));
        // },
        child: Card(
          elevation: 2.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: getProportionateScreenHeight(85),
            width: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(serviceImage),
                    fit: BoxFit.contain
                )
            ),
          ),
        ),
      ),
    );
  }
}
