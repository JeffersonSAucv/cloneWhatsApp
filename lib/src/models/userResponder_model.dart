// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

List<UserResponse> userResponseFromJson(String str) =>
    List<UserResponse>.from(json
        .decode(str)
        .map((userResponse) => UserResponse.fromJson(userResponse)));

class UserResponse {
  UserResponse({
    this.id,
    this.name,
    this.title,
    this.url,
    this.hora,
    this.thumbnailUrl,
    this.incomingCall,
  });

  int id;
  String name;
  String title;
  String url;
  String hora;
  String thumbnailUrl;
  bool incomingCall;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        url: json["url"],
        hora: json["hora"],
        thumbnailUrl: json["thumbnailUrl"],
        incomingCall: json["incomingCall"],
      );
}
