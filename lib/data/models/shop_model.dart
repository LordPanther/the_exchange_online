import 'models.dart';
import 'package:equatable/equatable.dart';

/// This is an auto generated class representing the StoreModel type in your schema.
class ShopModel extends Equatable {
  final String id;
  final String? name;
  final String? description;
  final UserModel? tenant;
  final String? email;
  final String? phoneNumber;
  final String? logo;
  final List<ProductModel>? products;
  final List<CategoryModel>? productCategories;
  final bool? isActive;
  final int? rating;
  final String? createdAt;
  final String? updatedAt;

  const ShopModel({
    required this.id,
    required this.name,
    required this.description,
    required this.tenant,
    required this.email,
    required this.phoneNumber,
    this.logo,
    this.products,
    this.productCategories,
    required this.isActive,
    this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  ShopModel cloneWith({
    name,
    description,
    tenant,
    email,
    phoneNumber,
    logo,
    products,
    productCategories,
    isActive,
    rating,
    createdAt,
    updatedAt,
  }) {
    return ShopModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      tenant: tenant ?? this.tenant,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      logo: logo ?? this.logo,
      products: products ?? this.products,
      productCategories: productCategories ?? this.productCategories,
      isActive: isActive ?? this.isActive,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  static ShopModel fromMap(Map<String, dynamic> data) {
    return ShopModel(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      tenant: data["tenant"],
      email: data["email"],
      phoneNumber: data["phoneNumber"],
      logo: data["logo"],
      products: data["products"],
      productCategories: data["productCategories"],
      isActive: data["isActive"],
      rating: data["rating"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tenant': tenant,
      'email': email,
      'phoneNumber': phoneNumber,
      'logo': logo,
      'products': products,
      'productCategories': productCategories,
      'isActive': isActive,
      'rating': rating,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "StoreModel:{name: $name, description: $description, tenant: $tenant, email: $email, phoneNumber: $phoneNumber, logo: $logo, products: $products, productsCategories: $productCategories, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        tenant,
        email,
        phoneNumber,
        logo,
        products,
        productCategories,
        isActive,
        createdAt,
        updatedAt,
      ];
}
