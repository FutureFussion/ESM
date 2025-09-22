import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? imageUrl;
  String? name;
  String? email;
  String? phoneNo;
  String? password;
  String? profile;
  String? address;
  String? country;
  String? state;
  String? city;
  Timestamp? createdAt;

  UserModel({
    this.id,
    this.imageUrl,
    this.name,
    this.email,
    this.phoneNo,
    this.password,
    this.profile,
    this.address,
    this.country,
    this.state,
    this.city,
    this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    password = json['password'];
    profile = json['profile'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    createdAt = json['createdAt'] is Timestamp ? json['createdAt'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['password'] = password;
    data['profile'] = profile;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['createdAt'] = createdAt?.toDate().toIso8601String();
    return data;
  }

  String getCreatedAtString() {
    if (createdAt != null) {
      return createdAt!.toDate().toString();
    }
    return '';
  }
}
