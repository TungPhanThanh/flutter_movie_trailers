import 'package:json_annotation/json_annotation.dart';

part 'belong_collection.g.dart';

@JsonSerializable()
class BelongsToCollection {
  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);

  int id;
  String name;
  String posterPath;
  String backdropPath;

  bool isEqual(BelongsToCollection belongsToCollection){
    return id == belongsToCollection?.id;
  }
}
