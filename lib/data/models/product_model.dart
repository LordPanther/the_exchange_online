import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? id;
  final String? categoryId;
  final String? name;
  final String? description;
  final List<String>? image;
  final int? rating;
  final int? quantity;
  final int? soldQuantity;
  final double? originalPrice;
  final int? percentOff;
  final bool? isAvailable;
  final String? storemodelID;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductModel({
    this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.quantity,
    required this.soldQuantity,
    required this.originalPrice,
    this.percentOff,
    required this.isAvailable,
    required this.storemodelID,
    required this.createdAt,
    required this.updatedAt,
  });

  ProductModel cloneWith({
    categoryId,
    name,
    description,
    image,
    rating,
    quantity,
    soldQuantity,
    originalPrice,
    percentOff,
    isAvailable,
    storemodelID,
    createdAt,
    updatedAt,
  }) {
    return ProductModel(
      id: id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
      soldQuantity: soldQuantity ?? this.soldQuantity,
      originalPrice: originalPrice ?? this.originalPrice,
      percentOff: percentOff ?? this.percentOff,
      isAvailable: isAvailable ?? this.isAvailable,
      storemodelID: storemodelID ?? this.storemodelID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static ProductModel fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data["id"],
      categoryId: data["categoryId"],
      name: data["name"],
      description: data["description"],
      image: data["image"],
      quantity: data["quantity"],
      soldQuantity: data["soldQuantity"],
      originalPrice: data["originalPrice"],
      percentOff: data["percentOff"],
      isAvailable: data["isAvailable"],
      storemodelID: data["storeModelID"],
      rating: data["rating"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'image': image,
      'rating': rating,
      'quantity': quantity,
      'soldQuantity': soldQuantity,
      'originalPrice': originalPrice,
      'percentOff': percentOff,
      'isAvailable': isAvailable,
      'storemodelID': storemodelID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "ProductModel:{name: $name, description: $description, image: $image, rating: $rating, quantity: $quantity, soldQuantity: $soldQuantity, oridinalPrice: $originalPrice, percentOff: $percentOff, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        categoryId,
        name,
        description,
        image,
        rating,
        quantity,
        soldQuantity,
        originalPrice,
        percentOff,
        isAvailable,
        storemodelID,
        createdAt,
        updatedAt,
      ];
}
