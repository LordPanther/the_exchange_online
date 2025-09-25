import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? storemodelID;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel({
    this.id,
    this.name,
    this.imageUrl,
    this.storemodelID,
    this.createdAt,
    this.updatedAt,
  });

  CategoryModel cloneWith({
    name,
    imageUrl,
    storemodelID,
  }) {
    return CategoryModel(
      id: id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      storemodelID: storemodelID ?? this.storemodelID,
    );
  }

  static CategoryModel fromMap(Map<String, dynamic> data) {
    return CategoryModel(
      id: data["id"],
      name: data["name"],
      imageUrl: data["imageUrl"],
      storemodelID: data["storemodelID"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'storemodelID': storemodelID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "CategoryModel:{id: $id, name: $name, imageUrl: $imageUrl, storemodelID: $storemodelID, createdAt: $createdAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        storemodelID,
        createdAt,
        updatedAt,
      ];
}
