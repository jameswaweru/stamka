import 'package:flutter/material.dart';
import 'package:stamka/size_config.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: SingleChildScrollView(
                child: Container(
                  height: SizeConfig.screenHeight * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(60),),
                      Container(
                        height: getProportionateScreenHeight(100),
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(50),),
                      Text("Welcome" , style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                      Text("Login to get started", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          labelText: "Username",
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          fillColor: Colors.redAccent[100],
                          focusColor: Colors.redAccent[100],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          fillColor: Colors.redAccent[100],
                          focusColor: Colors.redAccent[100],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: Container(
                  height: getProportionateScreenHeight(80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent[400]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Okay", style: TextStyle(color: Colors.black),)
                    ],
                  ),
                )
            )
          ],
        )
        // child: Stack(
        //   children: [
        //     Column(
        //       children: [
        //         SizedBox(height: 100,),
        //         Container(
        //           width: SizeConfig.screenWidth * 0.8,
        //           height: 100,
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage("assets/images/logo.png"),
        //               fit: BoxFit.contain
        //             )
        //           ),
        //         )
        //       ],
        //     ),
        //     Positioned(
        //       bottom: 10,
        //         left: 10,
        //         right: 10,
        //         child: Column(
        //           children: [
        //             Text("Welcome"),
        //             Text("Login to get started"),
        //             SizedBox(height: 15,),
        //             TextField(
        //               decoration: InputDecoration(
        //                 hintText: "Username",
        //                   labelText: "Username",
        //                 labelStyle: TextStyle(
        //                   fontSize: 15,
        //                   color: Colors.black,
        //                 ),
        //                 fillColor: Colors.redAccent[100],
        //                 focusColor: Colors.redAccent[100],
        //               ),
        //             )
        //           ],
        //         )
        //     )
        //   ],
        // ),
      ),
    );
  }
}
