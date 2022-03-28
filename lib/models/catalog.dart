import 'dart:convert';

class CatalogModels {
  static List<Item> items = [];
}

class Item {
  final int id;
  final String title;
  final String url;
  Item({
    required this.id,
    required this.title,
    required this.url,
  });

  Item copyWith({
    int? id,
    String? title,
    String? url,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'url': url});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() => 'Item(id: $id, title: $title, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ url.hashCode;
}
// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

// To parse this JSON data, do
//
//     final catalogModel = catalogModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<CatalogModel> catalogModelFromJson(String str) => List<CatalogModel>.from(
//     json.decode(str).map((x) => CatalogModel.fromJson(x)));

// String catalogModelToJson(List<CatalogModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CatalogModel {
//   CatalogModel({
//     required this.albumId,
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.thumbnailUrl,
//   });

//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   factory CatalogModel.fromJson(Map<String, dynamic> json) => CatalogModel(
//         albumId: json["albumId"],
//         id: json["id"],
//         title: json["title"],
//         url: json["url"],
//         thumbnailUrl: json["thumbnailUrl"],
//       );

//   Map<String, dynamic> toJson() => {
//         "albumId": albumId,
//         "id": id,
//         "title": title,
//         "url": url,
//         "thumbnailUrl": thumbnailUrl,
//       };
// }
