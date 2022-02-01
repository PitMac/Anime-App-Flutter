// ignore: duplicate_ignore
// ignore_for_file: constant_identifier_names

import 'dart:convert';

TrendingResponse trendingResponseFromJson(String str) =>
    TrendingResponse.fromJson(json.decode(str));

String trendingResponseToJson(TrendingResponse data) =>
    json.encode(data.toJson());

class TrendingResponse {
  TrendingResponse({
    required this.data,
  });

  List<Datum> data;

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      TrendingResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.links,
    required this.attributes,
    required this.relationships,
  });

  String id;
  TypeEnum? type;
  DatumLinks links;
  Attributes attributes;
  Map<String, Relationship> relationships;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: typeEnumValues.map[json["type"]],
        links: DatumLinks.fromJson(json["links"]),
        attributes: Attributes.fromJson(json["attributes"]),
        relationships: Map.from(json["relationships"]).map((k, v) =>
            MapEntry<String, Relationship>(k, Relationship.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeEnumValues.reverse![type],
        "links": links.toJson(),
        "attributes": attributes.toJson(),
        "relationships": Map.from(relationships)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Attributes {
  Attributes({
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.synopsis,
    required this.description,
    required this.coverImageTopOffset,
    required this.titles,
    required this.canonicalTitle,
    required this.abbreviatedTitles,
    required this.averageRating,
    required this.ratingFrequencies,
    required this.userCount,
    required this.favoritesCount,
    required this.startDate,
    required this.endDate,
    required this.nextRelease,
    required this.popularityRank,
    required this.ratingRank,
    required this.ageRating,
    required this.ageRatingGuide,
    required this.subtype,
    required this.status,
    required this.tba,
    this.posterImage,
    this.coverImage,
    required this.episodeCount,
    required this.episodeLength,
    required this.totalLength,
    required this.youtubeVideoId,
    required this.showType,
    required this.nsfw,
  });

  DateTime createdAt;
  DateTime updatedAt;
  String slug;
  String synopsis;
  String description;
  int coverImageTopOffset;
  Titles titles;
  String canonicalTitle;
  List<String> abbreviatedTitles;
  String? averageRating;
  Map<String, String> ratingFrequencies;
  int userCount;
  int favoritesCount;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? nextRelease;
  int popularityRank;
  int? ratingRank;
  AgeRating? ageRating;
  String? ageRatingGuide;
  ShowTypeEnum? subtype;
  Status? status;
  String? tba;
  PosterImage? posterImage;
  CoverImage? coverImage;
  int? episodeCount;
  int? episodeLength;
  int? totalLength;
  String? youtubeVideoId;
  ShowTypeEnum? showType;
  bool nsfw;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
        synopsis: json["synopsis"],
        description: json["description"],
        coverImageTopOffset: json["coverImageTopOffset"],
        titles: Titles.fromJson(json["titles"]),
        canonicalTitle: json["canonicalTitle"],
        abbreviatedTitles:
            List<String>.from(json["abbreviatedTitles"].map((x) => x)),
        averageRating: json["averageRating"],
        ratingFrequencies: Map.from(json["ratingFrequencies"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        userCount: json["userCount"],
        favoritesCount: json["favoritesCount"],
        startDate:
            DateTime.parse(json["startDate"] ?? '2014-08-10T15:38:09.928Z'),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        nextRelease: json["nextRelease"] == null
            ? null
            : DateTime.parse(json["nextRelease"]),
        popularityRank: json["popularityRank"],
        ratingRank: json["ratingRank"],
        ageRating: ageRatingValues.map[json["ageRating"]],
        ageRatingGuide: json["ageRatingGuide"],
        subtype: showTypeEnumValues.map[json["subtype"]],
        status: statusValues.map[json["status"]],
        tba: json["tba"],
        posterImage: PosterImage.fromJson(json["posterImage"]),
        coverImage: json["coverImage"] != null
            ? CoverImage.fromJson(json["coverImage"])
            : CoverImage.fromJson({'1': 'wes'}),
        episodeCount: json["episodeCount"],
        episodeLength: json["episodeLength"],
        totalLength: json["totalLength"],
        youtubeVideoId: json["youtubeVideoId"],
        showType: showTypeEnumValues.map[json["showType"]],
        nsfw: json["nsfw"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "slug": slug,
        "synopsis": synopsis,
        "description": description,
        "coverImageTopOffset": coverImageTopOffset,
        "titles": titles.toJson(),
        "canonicalTitle": canonicalTitle,
        "abbreviatedTitles":
            List<dynamic>.from(abbreviatedTitles.map((x) => x)),
        "averageRating": averageRating,
        "ratingFrequencies": Map.from(ratingFrequencies)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "userCount": userCount,
        "favoritesCount": favoritesCount,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate": endDate == null
            ? null
            : "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        // ignore: prefer_null_aware_operators
        "nextRelease":
            nextRelease == null ? null : nextRelease!.toIso8601String(),
        "popularityRank": popularityRank,
        "ratingRank": ratingRank,
        "ageRating": ageRatingValues.reverse![ageRating],
        "ageRatingGuide": ageRatingGuide,
        "subtype": showTypeEnumValues.reverse![subtype],
        "status": statusValues.reverse![status],
        "tba": tba,
        "posterImage": posterImage!.toJson(),
        "coverImage": coverImage!.toJson(),
        "episodeCount": episodeCount,
        "episodeLength": episodeLength,
        "totalLength": totalLength,
        "youtubeVideoId": youtubeVideoId,
        "showType": showTypeEnumValues.reverse![showType],
        "nsfw": nsfw,
      };
}

// ignore: constant_identifier_names
enum AgeRating { PG, R }

final ageRatingValues = EnumValues({"PG": AgeRating.PG, "R": AgeRating.R});

class CoverImage {
  CoverImage({
    required this.tiny,
    required this.large,
    required this.small,
    required this.original,
    required this.meta,
  });

  String tiny;
  String large;
  String small;
  String original;
  Meta meta;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        tiny: json["tiny"] ??
            'https://archive.org/download/no-photo-available/no-photo-available.png',
        large: json["large"] ??
            'https://archive.org/download/no-photo-available/no-photo-available.png',
        small: json["small"] ??
            'https://archive.org/download/no-photo-available/no-photo-available.png',
        original: json["original"] ??
            'https://archive.org/download/no-photo-available/no-photo-available.png',
        meta: json["meta"] != null
            ? Meta.fromJson(json["meta"])
            : Meta.fromJson({
                'sdad':
                    'https://archive.org/download/no-photo-available/no-photo-available.png'
              }),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny,
        "large": large,
        "small": small,
        "original": original,
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    required this.dimensions,
  });

  Dimensions dimensions;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        dimensions: json["dimensions"] != null
            ? Dimensions.fromJson(json["dimensions"])
            : Dimensions.fromJson({'sda': 'asd'}),
      );

  Map<String, dynamic> toJson() => {
        "dimensions": dimensions.toJson(),
      };
}

class Dimensions {
  Dimensions({
    required this.tiny,
    required this.large,
    required this.small,
    required this.medium,
  });

  Large tiny;
  Large large;
  Large small;
  Large? medium;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        tiny: json["tiny"] != null
            ? Large.fromJson(json["tiny"])
            : Large.fromJson({'sad': 'asd'}),
        large: json["large"] != null
            ? Large.fromJson(json["large"])
            : Large.fromJson({'sad': 'asd'}),
        small: json["small"] != null
            ? Large.fromJson(json["small"])
            : Large.fromJson({'sad': 'asd'}),
        medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny.toJson(),
        "large": large.toJson(),
        "small": small.toJson(),
        "medium": medium == null ? null : medium!.toJson(),
      };
}

class Large {
  Large({
    required this.width,
    required this.height,
  });

  int? width;
  int? height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      };
}

class PosterImage {
  PosterImage({
    required this.tiny,
    required this.large,
    required this.small,
    required this.medium,
    required this.original,
    required this.meta,
  });

  String tiny;
  String large;
  String small;
  String medium;
  String original;
  Meta meta;

  factory PosterImage.fromJson(Map<String, dynamic> json) => PosterImage(
        tiny: json["tiny"],
        large: json["large"],
        small: json["small"],
        medium: json["medium"],
        original: json["original"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny,
        "large": large,
        "small": small,
        "medium": medium,
        "original": original,
        "meta": meta.toJson(),
      };
}

// ignore: constant_identifier_names
enum ShowTypeEnum { TV }

final showTypeEnumValues = EnumValues({"TV": ShowTypeEnum.TV});

enum Status { CURRENT, FINISHED }

final statusValues =
    EnumValues({"current": Status.CURRENT, "finished": Status.FINISHED});

class Titles {
  Titles({
    required this.en,
    required this.enJp,
    required this.jaJp,
    required this.enUs,
  });

  String? en;
  String? enJp;
  String? jaJp;
  String? enUs;

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
        en: json["en"],
        enJp: json["en_jp"],
        jaJp: json["ja_jp"],
        enUs: json["en_us"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "en_jp": enJp,
        "ja_jp": jaJp,
        "en_us": enUs,
      };
}

class DatumLinks {
  DatumLinks({
    required this.self,
  });

  String self;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}

class Relationship {
  Relationship({
    required this.links,
  });

  RelationshipLinks links;

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        links: RelationshipLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
      };
}

class RelationshipLinks {
  RelationshipLinks({
    required this.self,
    required this.related,
  });

  String self;
  String related;

  factory RelationshipLinks.fromJson(Map<String, dynamic> json) =>
      RelationshipLinks(
        self: json["self"],
        related: json["related"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "related": related,
      };
}

enum TypeEnum { ANIME }

final typeEnumValues = EnumValues({"anime": TypeEnum.ANIME});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
