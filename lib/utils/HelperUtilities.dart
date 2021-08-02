


import 'SharedPrefManager.dart';

class HelperUtilities {


  static int getMonthDays(int month){
    if(month == 1){
      return 31;
    }
    if(month == 2){
      return 28;
    }
    if(month == 3){
      return 31;
    }
    if(month == 4){
      return 30;
    }
    if(month == 5){
      return 31;
    }
    if(month == 6){
      return 30;
    }
    if(month == 7){
      return 31;
    }
    if(month == 8){
      return 31;
    }
    if(month == 9){
      return 30;
    }
    if(month == 10){
      return 31;
    }
    if(month == 11){
      return 30;
    }
    if(month == 12){
      return 31;
    }
  }


  static String formatMsisdn(String msisdn){
    String formattedNumber = msisdn;
    if(msisdn.length == 9){
      formattedNumber = "254"+msisdn;
    }

    if(msisdn.length == 10){
      formattedNumber = "254"+msisdn.substring(1);
    }
    return formattedNumber;
  }

  static bool checkIfMsisdnIsValid(String msisdn){
    bool isValid = false;
    String pattern = r'(^(254|0)([7][0-9]|[1][0-1]){1}[0-9]{1}[0-9]{6}$)';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(msisdn)){
      isValid = true;
    }
    return isValid;
  }


}