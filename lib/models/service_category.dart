import 'package:stamka/models/service.dart';

class ServiceCategory {
  int categoryID;
  String categoryName;
  String categoryDescription;
  String categoryIcon;
  int active;
  List<Service> services;

  ServiceCategory({this.categoryID, this.categoryName, this.categoryDescription, this.categoryIcon, this.active, this.services});

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {

    var servicesList = json['services'] as List;
    List<Service> services = servicesList.map((i) => Service.fromJson(i)).toList();

    return ServiceCategory(
        categoryID: json['categoryID'],
        categoryName: json['categoryName'],
        categoryDescription : json['categoryDescription'],
        categoryIcon : json['categoryIcon'],
        active : json['active'],
        services : services
    );
  }

}