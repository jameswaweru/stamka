import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stamka/apis/auth_apis.dart';
import 'package:stamka/components/default_button.dart';
import 'package:stamka/models/dto/login_api_response.dart';
import 'package:stamka/pages/register.dart';
import 'package:stamka/screens/home.dart';
import 'package:stamka/utils/HelperUtilities.dart';
import 'package:stamka/utils/SharedPrefManager.dart';

import '../size_config.dart';

class StamkaLogin extends StatefulWidget {
  @override
  _StamkaLoginState createState() => _StamkaLoginState();
}

class _StamkaLoginState extends State<StamkaLogin> {


  final msisdnTextEditController = TextEditingController();
  final pinTextEditController = TextEditingController();
  bool isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;

    msisdnTextEditController.text = SharedPrefManager.getUserMsisdn();

  }

  void login() async{
      LoginApiReponse rep = await AuthApis().login(HelperUtilities.formatMsisdn(msisdnTextEditController.text), pinTextEditController.text);
      isLoading = false;
      if(rep.status == 200){
        SharedPrefManager.setIsAppActivated(true);
        SharedPrefManager.setIsRegistered(true);
        SharedPrefManager.setAgentBalance(rep.data.floatBalance.toString());
        SharedPrefManager.setAgentName(rep.data.agentName.toString());
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
        );
      }
    print("Login response .."+rep.message);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text("Login to get started", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    TextField(
                      controller: pinTextEditController,
                      obscureText: true,
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
                    SizedBox(height: getProportionateScreenHeight(10),),
                    DefaultButton(
                      text: "Login",
                      press: () async{

                        if(isLoading){
                          final snackBar = SnackBar(content: Text("Please wait. We are processing"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if(pinTextEditController.text.isEmpty){
                          final snackBar = SnackBar(content: Text("Error: Pin is required"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else if(!HelperUtilities.checkIfMsisdnIsValid(msisdnTextEditController.text)){
                          final snackBar = SnackBar(content: Text('Oops: '+msisdnTextEditController.text+" isn't a valid number"));
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }else{
                          setState(() {
                            isLoading = true;
                          });
                          SharedPrefManager.setUserMobileNumber(HelperUtilities.formatMsisdn(msisdnTextEditController.text));
                          //login();
                          LoginApiReponse rep = await AuthApis().login(HelperUtilities.formatMsisdn(msisdnTextEditController.text), pinTextEditController.text);
                          if(rep.status != 200){
                            setState(() {
                              isLoading = false;
                            });
                            final snackBar = SnackBar(
                                content: Text('Oops: '+rep.message));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }else{
                            setState(() {
                              isLoading = false;
                            });
                            // print("status:"+rep.status.toString());
                             print("Agent Details: floatBalance "+rep.data.floatBalance.toString());
                            SharedPrefManager.setIsAppActivated(true);
                            SharedPrefManager.setIsRegistered(true);
                            SharedPrefManager.setAgentBalance(rep.data.floatBalance.toString());
                            SharedPrefManager.setAgentName(rep.data.agentName.toString());
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                                  (Route<dynamic> route) => false,
                            );
                          }
                        }
                      },
                      height: getProportionateScreenHeight(65),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                        SizedBox(width: 10,),
                        InkWell(
                          child: Text("Register here" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          onTap: (){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => StamkaRegistration()),
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
