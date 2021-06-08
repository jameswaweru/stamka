import 'package:flutter/material.dart';
import 'package:stamka/components/default_button.dart';
import 'package:stamka/screens/home.dart';

import '../constants.dart';
import '../size_config.dart';

class TransactionReceipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call SizeConfig on your starting page
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),

        body: Stack(
          children: [
            Container(
                height: SizeConfig.screenHeight * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/success.png", height: getProportionateScreenHeight(100), width: getProportionateScreenWidth(100),),
                    SizedBox(height: 50,),
                    Text("Payment Successful" , style: TextStyle(fontFamily: 'Poppins' , color: Colors.green[400], fontSize: 24),),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, right: 45),
                      child: Text("You have successfully bought safaricom airtime of KSH 120 for phone number 0722 123 123" ,
                        style: TextStyle(fontFamily: 'Poppins' , color: Colors.black, fontSize: 19),textAlign: TextAlign.center,),
                    ),
                  ],
                )
            ),
            Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: DefaultButton(
                  text: "Okay",
                  press: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  height: getProportionateScreenHeight(65),
                ),

            )
          ],
        )

    );
  }
}
