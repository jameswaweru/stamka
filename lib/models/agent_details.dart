class AgentDetails {
  int agentID;
  String agentName;
  String MSISDN;
  String nationalID;
  int floatBalance;
  int active;


  AgentDetails({this.agentID, this.agentName, this.MSISDN, this.nationalID, this.floatBalance, this.active});

  factory AgentDetails.fromJson(Map<String, dynamic> json) {
    return AgentDetails(
        agentID: json['agentID'],
        agentName: json['agentName'],
        MSISDN: json['MSISDN'],
        nationalID: json['nationalID'],
        floatBalance: json['floatBalance'],
        active: json['active']
    );
  }

}