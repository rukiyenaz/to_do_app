import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({required this.id,required this.name,required this.email,r});

  Map<String,dynamic>toJson(){
    return {
      'id':id,
      'name':name,
      'email':email,
    };
  }

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json['id'], 
      name: json['name'], 
      email: json['email'], 
      );
  }
}