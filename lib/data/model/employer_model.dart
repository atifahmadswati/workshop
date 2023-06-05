// To parse this JSON data, do
//
//     final employerModel = employerModelFromJson(jsonString);

import 'dart:convert';

EmployerModel employerModelFromJson(String str) => EmployerModel.fromJson(json.decode(str));

String employerModelToJson(EmployerModel data) => json.encode(data.toJson());

class EmployerModel {
  final String? employerId;
  final String? organizationName;
  final String? emailAddress;
  final bool? isActive;
  final bool? isDeleted;
  final String? imageUrl;

  EmployerModel({
    this.employerId,
    this.organizationName,
    this.emailAddress,
    this.isActive,
    this.isDeleted,
    this.imageUrl,
  });

  factory EmployerModel.fromJson(Map<String, dynamic> json) => EmployerModel(
    employerId: json["employer_id"],
    organizationName: json["organization_name"],
    emailAddress: json["email_address"],
    isActive: json["is_active"],
    isDeleted: json["is_deleted"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "employer_id": employerId,
    "organization_name": organizationName,
    "email_address": emailAddress,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "image_url": imageUrl,
  };
}
