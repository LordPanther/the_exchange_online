import 'package:equatable/equatable.dart';

class AuctionItemModel extends Equatable {
  final String? id;
  final String? categoryId;
  final String? name;
  final String? description;
  final List<String>? images;
  final String? condition;
  final int? quantity;
  final double? startingBid;
  final bool? isAvailable;
  final DateTime createdAt;
  final DateTime closingAt;
  final DateTime updatedAt;

  const AuctionItemModel({
    this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.images,
    required this.condition,
    required this.quantity,
    required this.startingBid,
    required this.isAvailable,
    required this.createdAt,
    required this.closingAt,
    required this.updatedAt,
  });

  AuctionItemModel cloneWith({
    categoryId,
    name,
    description,
    images,
    condition,
    quantity,
    startingBid,
    isAvailable,
    createdAt,
    closingAt,
    updatedAt,
  }) {
    return AuctionItemModel(
      id: id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      condition: condition ?? this.condition,
      quantity: quantity ?? this.quantity,
      startingBid: startingBid ?? this.startingBid,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      closingAt: closingAt ?? this.closingAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static AuctionItemModel fromMap(Map<String, dynamic> data) {
    return AuctionItemModel(
      id: data["id"],
      categoryId: data["categoryId"],
      name: data["name"],
      description: data["description"],
      images: data["images"],
      quantity: data["quantity"],
      startingBid: data["startingBid"],
      condition: data["condition"],
      isAvailable: data["isAvailable"],
      createdAt: data["createdAt"],
      closingAt: data["closingAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'images': images,
      'quantity': quantity,
      'condition': condition,
      'startingBid': startingBid,
      'isAvailable': isAvailable,
      'createdAt': createdAt,
      'closingAt': closingAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "ProductModel:{name: $name, description: $description, images: $images, condition: $condition, quantity: $quantity, startingBid: $startingBid, isAvailable: $isAvailable, createdAt: $createdAt, closingAt: $closingAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        categoryId,
        name,
        description,
        images,
        condition,
        quantity,
        startingBid,
        isAvailable,
        createdAt,
        closingAt,
        updatedAt,
      ];
}
