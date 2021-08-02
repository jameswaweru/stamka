class Service {

  int serviceID;
  String serviceName;
  String serviceDescription;
  String serviceIcon;
  int active;

  Service({this.serviceID, this.serviceName, this.serviceDescription, this.serviceIcon, this.active});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
        serviceID: json['serviceID'],
        serviceName: json['serviceName'],
        serviceDescription : json['serviceDescription'],
        serviceIcon : json['serviceIcon'],
        active : json['active']
    );
  }
}