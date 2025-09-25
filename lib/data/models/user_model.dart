import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/delivery_address_model.dart';
import 'package:the_exchange_online/data/models/shop_model.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? handle;
  final String? avatar;
  final String? phoneNumber;
  final String? userName;
  final ShopModel? store;
  final String? createdAt;
  final String? updatedAt;
  final List<DeliveryAddressModel>? addresses;

  const UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.handle,
    this.avatar,
    this.phoneNumber,
    this.userName,
    this.store,
    this.createdAt,
    this.updatedAt,
    this.addresses,
  });

  UserModel cloneWith(
      {String? id,
      String? email,
      String? firstName,
      String? lastName,
      String? handle,
      String? avatar,
      String? phoneNumber,
      String? userName,
      ShopModel? store,
      String? createdAt,
      String? updatedAt,
      List<DeliveryAddressModel>? addresses}) {
    return UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        handle: handle ?? this.handle,
        avatar: avatar ?? this.avatar,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        userName: userName ?? this.userName,
        store: store ?? this.store,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        addresses: addresses ?? this.addresses);
  }

  static UserModel fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data["id"],
      email: data["email"],
      firstName: data["firstName"],
      lastName: data["lastName"],
      handle: data["handle"],
      avatar: data["avatar"],
      phoneNumber: data["phoneNumber"],
      userName: data["userName"],
      store: data["store"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
      addresses: data["addresses"],
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'handle': handle,
        'avatar': avatar,
        'phoneNumber': phoneNumber,
        'userName': userName,
        'store': store,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'addresses': addresses
      };

  @override
  List<Object?> get props => [
        email,
        id,
        avatar,
        firstName,
        lastName,
        handle,
        avatar,
        phoneNumber,
        userName,
        store,
        createdAt,
        updatedAt,
        addresses,
      ];
}
