import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stamka/apis/auth_apis.dart';
import 'package:stamka/components/default_button.dart';
import 'package:stamka/models/dto/apiResponse.dart';
import 'package:stamka/pages/login.dart';
import 'package:stamka/utils/HelperUtilities.dart';
import 'package:stamka/utils/SharedPrefManager.dart';

import '../size_config.dart';

class StamkaRegistration extends StatefulWidget {
  @override
  _StamkaRegistrationState createState() => _StamkaRegistrationState();
}

class _StamkaRegistrationState extends State<StamkaRegistration> {


  bool isLoading;
  final fNameTextEditController = TextEditingController();
  final lNameTextEditController = TextEditingController();
  final msisdnTextEditController = TextEditingController();
  final nationalIDTextEditController = TextEditingController();
  final pinTextEditController = TextEditingController();
  final confirmPinTextEditController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    msisdnTextEditController.text = SharedPrefManager.getUserMsisdn();

  }


  // registerUser () async{
  //   ApiResponse resp = await AuthApis().registerAgent(
  //       msisdnTextEditController.text,
  //       fNameTextEditController.text,
  //       lNameTextEditController.text,
  //       nationalIDTextEditController.text,
  //       pinTextEditController.text);
  //
  //   if(resp.status == 200){
  //     print("Successfully registered..");
  //     SharedPrefManager.setIsRegistered(true);
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => StamkaLogin()),
  //           (Route<dynamic> route) => false,
  //     );
  //   }else{
  //     print("Registration failed..");
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultButton(
        text: "Register",
        press: () async{
          if(HelperUtilities.checkIfMsisdnIsValid(msisdnTextEditController.text)) {

            if(pinTextEditController.text != confirmPinTextEditController.text){
              final snackBar = SnackBar(
                  content: Text('Error: Pin mismatch'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }else {

              setState(() {
                isLoading = true;
              });
              SharedPrefManager.setUserMobileNumber(HelperUtilities.formatMsisdn(msisdnTextEditController.text));

              ApiResponse resp = await AuthApis().registerAgent(
                  HelperUtilities.formatMsisdn(msisdnTextEditController.text),
                  fNameTextEditController.text,
                  lNameTextEditController.text,
                  nationalIDTextEditController.text,
                  pinTextEditController.text);
              if (resp.status == 200) {

                setState(() {
                  isLoading = false;
                });

                print("Successfully registered..");
                SharedPrefManager.setIsRegistered(true);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StamkaLogin()),
                      (Route<dynamic> route) => false,
                );
              } else {
                setState(() {
                  isLoading = false;
                });
                final snackBar = SnackBar(
                    content: Text('Oops: Registration failed'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          }else{
            setState(() {
              isLoading = false;
            });
            final snackBar = SnackBar(
                content: Text('Oops: Invalid mobile number'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

        },
        height: getProportionateScreenHeight(65),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Stack(

          children: [
            ListView(
              children: [
                Column(
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
                    SizedBox(height: getProportionateScreenHeight(20),),
                    Text("Welcome" , style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    Text("Register to get started", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: fNameTextEditController,
                            decoration: InputDecoration(
                              hintText: "First Name",
                              labelText: "First Name",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              fillColor: Colors.redAccent[100],
                              focusColor: Colors.redAccent[100],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            controller: lNameTextEditController,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              fillColor: Colors.redAccent[100],
                              focusColor: Colors.redAccent[100],
                            ),
                          ),
                        ),
                      ],
                    ),

                    TextField(
                      controller: nationalIDTextEditController,
                      decoration: InputDecoration(
                        hintText: "National ID",
                        labelText: "National ID",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        fillColor: Colors.redAccent[100],
                        focusColor: Colors.redAccent[100],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    TextField(
                      controller: msisdnTextEditController,
                      decoration: InputDecoration(
                        hintText: "MSISDN",
                        labelText: "MSISDN",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        fillColor: Colors.redAccent[100],
                        focusColor: Colors.redAccent[100],
                      ),
                    ),

                    SizedBox(height: getProportionateScreenHeight(10),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            controller: pinTextEditController,
                            decoration: InputDecoration(
                              hintText: "Pin",
                              labelText: "Pin",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              fillColor: Colors.redAccent[100],
                              focusColor: Colors.redAccent[100],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            controller: confirmPinTextEditController,
                            decoration: InputDecoration(
                              hintText: "Confirm Pin",
                              labelText: "Confirm Pin",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              fillColor: Colors.redAccent[100],
                              focusColor: Colors.redAccent[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already registered?" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                        SizedBox(width: getProportionateScreenWidth(10),),
                        InkWell(
                          child: Text("Login here" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          onTap: (){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => StamkaLogin()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ],
                    )

                  ],
                )
              ],
            ),
            Container(
              child: isLoading ? Center(
                  child: SpinKitRotatingCircle(
                    color: Colors.redAccent,
                    size: 70.0,
                  )
              ) : Column(children: [],),
            )
          ],
        ),
      ),
    );
  }
}
