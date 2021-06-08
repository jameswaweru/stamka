import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stamka/screens/sign_up.dart';

import '../size_config.dart';

class LaunchApp extends StatefulWidget {
  @override
  _LaunchAppState createState() => _LaunchAppState();
}

class _LaunchAppState extends State<LaunchApp> {

  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
            () => Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 600),
                type: PageTransitionType.fade,
                child: SignUp())));
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenWidth(200),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain
                    )
                ),
              ),
              SizedBox(height: 10,),
              SpinKitRotatingCircle(
                color: Colors.redAccent,
                size: 50.0,
              )
            ],
          ),
        )
    );
  }
}




// class LaunchApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {




    // return Scaffold(
    //   body: Container(
    //     height: SizeConfig.screenHeight * 0.8,
    //     width: SizeConfig.screenWidth,
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Container(
    //             height: getProportionateScreenHeight(100),
    //             width: getProportionateScreenWidth(200),
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     image: AssetImage("assets/images/logo.png"),
    //                     fit: BoxFit.contain
    //                 )
    //             ),
    //           ),
    //           SpinKitRotatingCircle(
    //             color: Colors.redAccent,
    //             size: 50.0,
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );




    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         height: SizeConfig.screenHeight,
    //         width: SizeConfig.screenWidth,
    //
    //         child: Center(
    //           child: Column(
    //             children: [
    //               Container(
    //                 height: getProportionateScreenHeight(100),
    //                 width: getProportionateScreenWidth(200),
    //                 decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                     image: AssetImage("assets/images/logo.png"),
    //                     fit: BoxFit.contain
    //                   )
    //                 ),
    //               ),
    //               SpinKitRotatingCircle(
    //                 color: Colors.redAccent,
    //                 size: 50.0,
    //               )
    //             ],
    //           ),
    //         )
    //       )
    //     ],
    //   ),
    // );
//   }
// }
