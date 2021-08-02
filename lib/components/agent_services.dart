import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stamka/apis/stamka_services.dart';
import 'package:stamka/components/service_card.dart';
import 'package:stamka/models/service.dart';
import 'package:stamka/models/service_category.dart';
import 'package:stamka/screens/bill_payments.dart';
import 'package:stamka/screens/purchase_airtime.dart';
import 'package:stamka/size_config.dart';

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
              height: getProportionateScreenHeight(90),
            width: double.infinity,
            child: FutureBuilder(
                future: StamkaServices().fetchServicesInACategory(1),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Container(
                        child: Center(
                            child: Text("Loading...")
                        )
                    );
                  }else{

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Service service = snapshot.data[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ServiceCard(
                            serviceImage: service.serviceIcon,
                            press: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      duration: Duration(milliseconds: 600),
                                      type: PageTransitionType.fade,
                                      child: PurchaseAirtime()));
                            },
                          ),
                        );
                      },
                    );
                  }
                }
            )

          ),

          SizedBox(
            height: getProportionateScreenHeight(15),
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
              height: getProportionateScreenHeight(90),
              width: double.infinity,
              child: FutureBuilder(
                  future: StamkaServices().fetchServicesInACategory(2),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.data == null){
                      return Container(
                          child: Center(
                              child: Text("Loading...")
                          )
                      );
                    }else{

                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Service service = snapshot.data[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ServiceCard(
                              serviceImage: service.serviceIcon,
                              press: (){
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 600),
                                        type: PageTransitionType.fade,
                                        child: PurchaseAirtime()));
                              },
                            ),
                          );
                        },
                      );
                    }
                  }
              )

          ),

          SizedBox(
            height: getProportionateScreenHeight(15),
          ),

        ],
      ),
    );
  }
}
