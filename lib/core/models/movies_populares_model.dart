// To parse this JSON data, do
//
//     final popularesModel = popularesModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter_app_series_amaris/core/models/movie_model.dart';

class PopularesModel {
    PopularesModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<SeriesModel>? results;
    int? totalPages;
    int? totalResults;

    factory PopularesModel.fromJson(String str) => PopularesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PopularesModel.fromMap(Map<String, dynamic> json) => PopularesModel(
        page: json["page"],
        results: List<SeriesModel>.from(json["results"].map((x) => SeriesModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

enum OriginalLanguage { EN, HI, ES }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "es": OriginalLanguage.ES,
    "hi": OriginalLanguage.HI
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
