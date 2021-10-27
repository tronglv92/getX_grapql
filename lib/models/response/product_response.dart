import 'dart:convert';

import 'package:get_grapql_master/models/response/thumbnail.dart';

class ProductResponse{
  final String id;
  final String name;
  final String? description;
  final ThumbNail? thumbNail;
  ProductResponse({required this.id,required this.name,this.description,this.thumbNail});
  factory ProductResponse.fromRawJson(String str) =>
      ProductResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        id: json['node']["id"],
        name: json['node']["name"],
        description: json['node']["description"],
          thumbNail:ThumbNail.fromJson(json['node']["thumbnail"])
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "thumbnail":thumbNail?.toJson()
  };
}