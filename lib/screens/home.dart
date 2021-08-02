import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stamka/components/agent_services.dart';
import 'package:stamka/components/agents_buy_float.dart';
import 'package:stamka/utils/SharedPrefManager.dart';

import '../constants.dart';
import '../size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  TabController _controller;
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  void initState() {

    _controller = new TabController(length: 2, vsync: this);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: kIconColor,
          ),
          onPressed: () {},
        ),
        title: Text("",
          style: TextStyle(color: kTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: ClipOval(child: Image.asset("assets/images/profile.png")),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                // height: SizeConfig.screenHeight * 0.37,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning "+SharedPrefManager.getAgentName(),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 15
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: getProportionateScreenHeight(200),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25 , right: 25 , top: 12, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Your float balance is"),
                                //SharedPrefManager.getAgentBalance().isNotEmpty &&  ? "Ksh: "+formatCurrency.format(SharedPrefManager.getAgentBalance()) :
                                Text(  "0.00" , style: TextStyle(fontSize: 30),),
                                Text("Your Earnings: Ksh "+formatCurrency.format(1000) , style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/profile.png"),
                                          fit: BoxFit.contain
                                      )
                                  ),
                                ),
                                Text("Top Up"),
                                Text("Float")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),

              DefaultTabController(
                length: 2,
                child: TabBar(
                  controller: _controller,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).accentColor,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      child: Text(
                        "Sell",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Buy Float",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: SizeConfig.screenHeight,
                child: new TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    AgentServices(),
                    BuyFloatTab(),
                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );


    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.menu,
    //         color: kIconColor,
    //       ),
    //       onPressed: () {},
    //     ),
    //     title: Text("",
    //       style: TextStyle(color: kTextColor),
    //     ),
    //     centerTitle: true,
    //     actions: [
    //       IconButton(
    //         icon: ClipOval(child: Image.asset("assets/images/profile.png")),
    //         onPressed: () {},
    //       )
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(15.0),
    //     child: Column(
    //       children: [
    //         Container(
    //           // height: SizeConfig.screenHeight * 0.37,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "Good Morning John",
    //                 style: TextStyle(
    //                     fontFamily: 'Poppins',
    //                     color: Colors.black,
    //                     fontSize: 15
    //                 ),
    //               ),
    //               SizedBox(height: 10,),
    //               Container(
    //                 height: getProportionateScreenHeight(200),
    //                 width: double.infinity,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: Colors.grey[200],
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 25 , right: 25 , top: 12, bottom: 12),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text("Your float balance is"),
    //                           Text("Ksh: 1,234" , style: TextStyle(fontSize: 30),),
    //                           Text("Your Earnings: Ksh 1,234.00" , style: TextStyle(fontWeight: FontWeight.bold),)
    //                         ],
    //                       ),
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Container(
    //                             height: 60,
    //                             width: 60,
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(60),
    //                                 image: DecorationImage(
    //                                     image: AssetImage("assets/images/profile.png"),
    //                                     fit: BoxFit.contain
    //                                 )
    //                             ),
    //                           ),
    //                           Text("Top Up"),
    //                           Text("Float")
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //
    //             ],
    //           ),
    //         ),
    //
    //         DefaultTabController(
    //           length: 2,
    //           child: TabBar(
    //             controller: _controller,
    //             labelColor: Theme.of(context).primaryColor,
    //             unselectedLabelColor: Theme.of(context).accentColor,
    //             isScrollable: false,
    //             tabs: [
    //               Tab(
    //                 child: Text(
    //                   "Sell",
    //                   style: TextStyle(fontSize: 18.0),
    //                 ),
    //               ),
    //               Tab(
    //                 child: Text(
    //                   "Float",
    //                   style: TextStyle(fontSize: 18.0),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //
    //         Expanded(
    //           child: ListView(
    //             scrollDirection: Axis.vertical,
    //             shrinkWrap: true,
    //             children: [
    //               Container(
    //                 height: SizeConfig.screenHeight * 0.45,
    //                 child: TabBarView(
    //                     controller: _controller,
    //                     children: [
    //                       AgentServices(),
    //                       Text("sss")
    //                     ]
    //                 ),
    //               )
    //             ],
    //           ),
    //         )

            // SingleChildScrollView(
            //   child: Container(
            //     height: SizeConfig.screenHeight * 0.45,
            //     child: TabBarView(
            //         controller: _controller,
            //         children: [
            //           AgentServices(),
            //           Text("sss")
            //         ]
            //     ),
            //   )
            // )


            // Container(
            //   height: SizeConfig.screenHeight * 0.45,
            //   decoration: BoxDecoration(
            //     color: Colors.red
            //   ),
            //   child: Center(
            //     child: Text("wew"),
            //   ),
            // )

            // DefaultTabController(
            //     length: 2,
            //     child: TabBar(
            //       controller: _controller,
            //       labelColor: Theme.of(context).primaryColor,
            //       unselectedLabelColor: Theme.of(context).accentColor,
            //       isScrollable: false,
            //       tabs: [
            //         Tab(
            //           child: Text(
            //             "Sell",
            //             style: TextStyle(fontSize: 18.0),
            //           ),
            //         ),
            //         Tab(
            //           child: Text(
            //             "Float",
            //             style: TextStyle(fontSize: 18.0),
            //           ),
            //         ),
            //       ],
            //     ),
            // ),

            // TabBarView(
            //     controller: _controller,
            //     children: [
            //       Text("ass"),
            //       Text("sss")
            //     ]
            // )

            // SingleChildScrollView(
            //   child: new TabBarView(
            //     controller: _controller,
            //     children: <Widget>[
            //       new Container(
            //         child: Center(),
            //       ),
            //       new Card(
            //         child: new ListTile(
            //           leading: const Icon(Icons.location_on),
            //           title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
            //           trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
            //         ),
            //       ),
            //     ],
            //   )
            // )

            // ListView(
            //   children: [
            //     TabBarView(
            //         controller: _controller,
            //         children: [
            //       new Container(
            //         child: Center(),
            //       ),
            //       new Card(
            //         child: new ListTile(
            //           leading: const Icon(Icons.location_on),
            //           title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
            //           trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
            //         ),
            //       ),
            //     ])
            //   ],
            // )

            // Container(
            //   height: SizeConfig.screenHeight,
            //   child: new TabBarView(
            //     controller: _controller,
            //     children: <Widget>[
            //       new Container(
            //         child: Center(),
            //       ),
            //       new Card(
            //         child: new ListTile(
            //           leading: const Icon(Icons.location_on),
            //           title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
            //           trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // TabBarView(
            //     controller: _controller,
            //     children: [
            //       Container(),
            //       Container()
            //     ]
            // )
    //       ],
    //     ),
    //   )
    // );
  }
}
