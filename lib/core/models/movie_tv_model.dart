import 'dart:convert';

class DetailMovieTvModel {
    DetailMovieTvModel({
        this.adult,
        this.backdropPath,
        this.createdBy,
        this.episodeRunTime,
        this.firstAirDate,
        this.genres,
        this.homepage,
        this.id,
        this.inProduction,
        this.languages,
        this.lastAirDate,
        this.lastEpisodeToAir,
        this.name,
        this.nextEpisodeToAir,
        this.networks,
        this.numberOfEpisodes,
        this.numberOfSeasons,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.seasons,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.type,
        this.voteAverage,
        this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    List<CreatedBy>? createdBy;
    List<int>? episodeRunTime;
    DateTime? firstAirDate;
    List<Genre>? genres;
    String? homepage;
    int? id;
    bool? inProduction;
    List<String>? languages;
    DateTime? lastAirDate;
    TEpisodeToAir? lastEpisodeToAir;
    String? name;
    TEpisodeToAir? nextEpisodeToAir;
    List<Network>? networks;
    int? numberOfEpisodes;
    int? numberOfSeasons;
    List<String>? originCountry;
    String? originalLanguage;
    String? originalName;
    String? overview;
    double? popularity;
    String? posterPath;
    List<Network>? productionCompanies;
    List<ProductionCountry>? productionCountries;
    List<Season>? seasons;
    List<SpokenLanguage>? spokenLanguages;
    String? status;
    String? tagline;
    String? type;
    double? voteAverage;
    int? voteCount;

    factory DetailMovieTvModel.fromJson(String str) => DetailMovieTvModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DetailMovieTvModel.fromMap(Map<String, dynamic> json) => DetailMovieTvModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromMap(x))),
        episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir: TEpisodeToAir.fromMap(json["last_episode_to_air"]),
        name: json["name"],
        nextEpisodeToAir: TEpisodeToAir.fromMap(json["next_episode_to_air"]),
        networks: List<Network>.from(json["networks"].map((x) => Network.fromMap(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromMap(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromMap(x))),
        seasons: List<Season>.from(json["seasons"].map((x) => Season.fromMap(x))),
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "created_by": List<dynamic>.from(createdBy!.map((x) => x.toMap())),
        "episode_run_time": List<dynamic>.from(episodeRunTime!.map((x) => x)),
        "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genres": List<dynamic>.from(genres!.map((x) => x.toMap())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages!.map((x) => x)),
        "last_air_date": "${lastAirDate!.year.toString().padLeft(4, '0')}-${lastAirDate!.month.toString().padLeft(2, '0')}-${lastAirDate!.day.toString().padLeft(2, '0')}",
        "last_episode_to_air": lastEpisodeToAir!.toMap(),
        "name": name,
        "next_episode_to_air": nextEpisodeToAir!.toMap(),
        "networks": List<dynamic>.from(networks!.map((x) => x.toMap())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x.toMap())),
        "production_countries": List<dynamic>.from(productionCountries!.map((x) => x.toMap())),
        "seasons": List<dynamic>.from(seasons!.map((x) => x.toMap())),
        "spoken_languages": List<dynamic>.from(spokenLanguages!.map((x) => x.toMap())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class CreatedBy {
    CreatedBy({
        this.id,
        this.creditId,
        this.name,
        this.gender,
        this.profilePath,
    });

    int? id;
    String? creditId;
    String? name;
    int? gender;
    String? profilePath;

    factory CreatedBy.fromJson(String str) => CreatedBy.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CreatedBy.fromMap(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        creditId: json["credit_id"],
        name: json["name"],
        gender: json["gender"],
        profilePath: json["profile_path"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "credit_id": creditId,
        "name": name,
        "gender": gender,
        "profile_path": profilePath,
    };
}

class Genre {
    Genre({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}

class TEpisodeToAir {
    TEpisodeToAir({
        this.airDate,
        this.episodeNumber,
        this.id,
        this.name,
        this.overview,
        this.productionCode,
        this.seasonNumber,
        this.stillPath,
        this.voteAverage,
        this.voteCount,
    });

    DateTime? airDate;
    int? episodeNumber;
    int? id;
    String? name;
    String? overview;
    String? productionCode;
    int? seasonNumber;
    String? stillPath;
    double? voteAverage;
    int? voteCount;

    factory TEpisodeToAir.fromJson(String str) => TEpisodeToAir.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TEpisodeToAir.fromMap(Map<String, dynamic> json) => TEpisodeToAir(
        airDate: DateTime.parse(json["air_date"]),
        episodeNumber: json["episode_number"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        productionCode: json["production_code"],
        seasonNumber: json["season_number"],
        stillPath: json["still_path"] == null ? null : json["still_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "air_date": "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber,
        "id": id,
        "name": name,
        "overview": overview,
        "production_code": productionCode,
        "season_number": seasonNumber,
        "still_path": stillPath == null ? null : stillPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class Network {
    Network({
        this.name,
        this.id,
        this.logoPath,
        this.originCountry,
    });

    String? name;
    int? id;
    String? logoPath;
    String? originCountry;

    factory Network.fromJson(String str) => Network.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Network.fromMap(Map<String, dynamic> json) => Network(
        name: json["name"],
        id: json["id"],
        logoPath: json["logo_path"] == null ? null : json["logo_path"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
        "logo_path": logoPath == null ? null : logoPath,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    ProductionCountry({
        this.iso31661,
        this.name,
    });

    String? iso31661;
    String? name;

    factory ProductionCountry.fromJson(String str) => ProductionCountry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductionCountry.fromMap(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class Season {
    Season({
        this.airDate,
        this.episodeCount,
        this.id,
        this.name,
        this.overview,
        this.posterPath,
        this.seasonNumber,
    });

    DateTime? airDate;
    int? episodeCount;
    int? id;
    String? name;
    String? overview;
    String? posterPath;
    int? seasonNumber;

    factory Season.fromJson(String str) => Season.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Season.fromMap(Map<String, dynamic> json) => Season(
        airDate: DateTime.parse(json["air_date"]),
        episodeCount: json["episode_count"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
    );

    Map<String, dynamic> toMap() => {
        "air_date": "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode_count": episodeCount,
        "id": id,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "season_number": seasonNumber,
    };
}

class SpokenLanguage {
    SpokenLanguage({
        this.englishName,
        this.iso6391,
        this.name,
    });

    String? englishName;
    String? iso6391;
    String? name;

    factory SpokenLanguage.fromJson(String str) => SpokenLanguage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
