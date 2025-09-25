import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final String id;
  final String? imageUrl;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  const BannerModel({
    required this.id,
    required this.imageUrl,
    // this.createdAt,
    // this.updatedAt,
  });

  BannerModel cloneWith({id, imageUrl}) {
    return BannerModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      // createdAt: createdAt,
      // updatedAt: updatedAt,
    );
  }

  static BannerModel fromMap(Map<String, dynamic> data) {
    return BannerModel(
      id: data["id"],
      imageUrl: data["image_url"],
      // createdAt: data["createdAt"],
      // updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      // 'createdAt': createdAt,
      // 'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "BannerModel:{imageUrl: $imageUrl,}";
  }

  @override
  List<Object?> get props => [
    id,
    imageUrl,
    // createdAt,
    // updatedAt,
  ];
}
