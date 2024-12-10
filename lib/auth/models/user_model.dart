import 'package:flutter/material.dart';

class UserModel {
  int id;
  String name;
  String email;
  String password;

  UserModel({required this.id,required this.name,required this.email,required this.password});

  Map<String,dynamic>toJson(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'password':password
    };
  }

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json['id'], 
      name: json['name'], 
      email: json['email'], 
      password: json['password']);
  }
}