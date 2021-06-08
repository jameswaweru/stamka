import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stamka/components/service_card.dart';
import 'package:stamka/screens/bill_payments.dart';
import 'package:stamka/screens/purchase_airtime.dart';

class AgentServices extends StatefulWidget {
  @override
  _AgentServicesState createState() => _AgentServicesState();
}

class _AgentServicesState extends State<AgentServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Airtime",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 90,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ServiceCard(
                  serviceImage: "https://www.multichoice.com/media/1221/2011-2x.png",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: PurchaseAirtime()));
                  },
                ),
                ServiceCard(
                  serviceImage: "https://connectnigeria.com/articles/wp-content/uploads/2015/09/DSTV-1.jpg",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: PurchaseAirtime()));
                  },
                ),
                ServiceCard(
                  serviceImage: "https://www.multichoice.com/media/1221/2011-2x.png",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: PurchaseAirtime()));
                  },
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Power",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 90,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ServiceCard(
                  serviceImage: "https://www.multichoice.com/media/1221/2011-2x.png",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: BillPayments()));
                  },
                ),
                ServiceCard(
                  serviceImage: "https://pbs.twimg.com/profile_images/557464424580005888/mDKpmfdq.png",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: BillPayments()));
                  },
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Power",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 90,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ServiceCard(
                  serviceImage: "https://www.multichoice.com/media/1221/2011-2x.png",
                  press: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: BillPayments()));
                  },
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
