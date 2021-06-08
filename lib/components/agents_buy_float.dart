import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stamka/components/service_card.dart';
import 'package:stamka/screens/transaction_receipt.dart';

import '../size_config.dart';

class BuyFloatTab extends StatefulWidget {
  @override
  _BuyFloatTabState createState() => _BuyFloatTabState();
}

class _BuyFloatTabState extends State<BuyFloatTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenHeight(15),),
          Text("How much float would you like to top-up to your wallet"),
          SizedBox(height: getProportionateScreenHeight(15),),
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
          Container(
            height: 90,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [

                ServiceCard(
                  serviceImage: "https://www.rechargestatic.com/spree/taxons/383/product/airtel_kenya.jpg",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: TransactionReceipt()));
                  },
                ),
                ServiceCard(serviceImage: "https://unifun.com/wp-content/uploads/2019/11/telkom_520x272.png", press: (){},),
                ServiceCard(serviceImage: "https://www.multichoice.com/media/1221/2011-2x.png", press: (){},),

              ],
            ),
          )
        ],
      ),
    );
  }
}
