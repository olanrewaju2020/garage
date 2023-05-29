import 'package:garage_repair/Models/user.dart';

class ServiceLog {
  String uuid, description, category;
  DateTime? dateCreated;
  User? postedBy;

  ServiceLog(
      {this.uuid = '',
      this.description = '',
      this.category = '',
      this.dateCreated,
      this.postedBy});

  factory ServiceLog.fromJson(Map<String, dynamic> json) => ServiceLog(
    uuid: json['uuid'],
    description: json['description'],
    category: json['category'],
    dateCreated: json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']),
    postedBy:json['postedBy'] == null ? null : User.fromJson(json['postedBy'])
  );

  @override
  String toString() {
    return 'ServiceLog{uuid: $uuid, description: $description, category: $category, dateCreated: $dateCreated, postedBy: $postedBy}';
  }

  sendMesage() => {
    "postedBy": uuid,
    "comment": description,
    "category": category
  };

}