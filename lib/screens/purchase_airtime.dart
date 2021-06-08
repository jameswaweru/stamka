import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stamka/components/default_button.dart';
import 'package:stamka/components/service_card.dart';
import 'package:stamka/screens/transaction_receipt.dart';

import '../constants.dart';
import '../size_config.dart';

class PurchaseAirtime extends StatefulWidget {
  @override
  _PurchaseAirtimeState createState() => _PurchaseAirtimeState();
}

class _PurchaseAirtimeState extends State<PurchaseAirtime> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Text("Airtime", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [

            Container(
              height: SizeConfig.screenHeight * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Phone number",
                          labelText: "Enter Phone Number",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      maxLines: 1,
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Amount",
                          labelText: "Enter Amount",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                          border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      maxLines: 1,
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: DefaultButton(
                  text: "Buy",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: TransactionReceipt()));
                  },
                  height: getProportionateScreenHeight(65),
                )
            )
          ],
        ),
      ),
    );
  }
}
