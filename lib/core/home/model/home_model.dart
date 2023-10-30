/// * --------------------------------------------------------------------------- * ///
/// 
/// project name  : bloc master setup
/// devloper name : karthikeyan maruthamchalam
/// created date  : Oct, 28 2023 8:48 Pm
/// 
///  * --------------------------------------------------------------------------- * ///

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    final List<Datum>? data;

    HomeModel({
        this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    Datum({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
