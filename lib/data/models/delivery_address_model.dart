import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/location_model.dart';

/// This is an auto generated class representing the DeliveryAddressModel type in your schema.
class DeliveryAddressModel extends Equatable {
  final String id;
  final String? recieverName;
  final String? phoneNumber;
  final String? detailAddress;
  final bool? isDefault;
  final LocationModel? city;
  final LocationModel? district;
  final LocationModel? ward;
  final String? usermodelID;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deliveryAddressModelCityId;
  final String? deliveryAddressModelDistrictId;
  final String? deliveryAddressModelWardId;

  const DeliveryAddressModel({
    required this.id,
    this.recieverName,
    this.phoneNumber,
    this.detailAddress,
    this.isDefault,
    required this.city,
    required this.district,
    required this.ward,
    required this.usermodelID,
    this.createdAt,
    this.updatedAt,
    required this.deliveryAddressModelCityId,
    required this.deliveryAddressModelDistrictId,
    required this.deliveryAddressModelWardId,
  });

  DeliveryAddressModel cloneWith(
      {recieverName,
      phoneNumber,
      detailAddress,
      isDefault,
      city,
      district,
      ward,
      usermodelID,
      deliveryAddressModelCityId,
      deliveryAddressModelDistrictId,
      deliveryAddressModelWardId}) {
    return DeliveryAddressModel(
      id: id,
      recieverName: recieverName ?? this.recieverName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      detailAddress: detailAddress ?? this.detailAddress,
      isDefault: isDefault ?? this.isDefault,
      city: city ?? this.city,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      usermodelID: usermodelID ?? this.usermodelID,
      deliveryAddressModelCityId:
          deliveryAddressModelCityId ?? this.deliveryAddressModelCityId,
      deliveryAddressModelDistrictId:
          deliveryAddressModelDistrictId ?? this.deliveryAddressModelDistrictId,
      deliveryAddressModelWardId:
          deliveryAddressModelWardId ?? this.deliveryAddressModelWardId,
    );
  }

  static DeliveryAddressModel fromMap(Map<String, dynamic> data) {
    return DeliveryAddressModel(
      id: data["id"],
      recieverName: data["recieverName"],
      phoneNumber: data["phoneNumber"],
      detailAddress: data["detailAddress"],
      isDefault: data["isDefault"],
      city: data["city"],
      district: data["district"],
      ward: data["ward"],
      usermodelID: data["usermodelID"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
      deliveryAddressModelCityId: data["deliveryAddressModelCityId"],
      deliveryAddressModelDistrictId: data["deliveryAddressModelDistrictId"],
      deliveryAddressModelWardId: data["deliveryAddressModelWardId"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'recieverName': recieverName,
      'phoneNumber': phoneNumber,
      'detailAddress': detailAddress,
      'isDefault': isDefault,
      'city': city,
      'district': district,
      'ward': ward,
      'usermodelID': usermodelID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deliveryAddressModelCityId': deliveryAddressModelCityId,
      'deliveryAddressModelDistrictId': deliveryAddressModelDistrictId,
      'deliveryAddressModelWardId': deliveryAddressModelWardId,
    };
  }

  @override
  String toString() {
    return "DeliveryAddressModel:{id: $id, recieverName: $recieverName, phoneNumber: $phoneNumber, detailAddress: $detailAddress, isDefault: $isDefault, city: $city, district: $district, ward: $ward, usermodelID: $usermodelID, createdAt: $createdAt, updatedAt: $updatedAt, deliveryAddressModelCityId: $deliveryAddressModelCityId, deliveryAddressModelDistrictId: $deliveryAddressModelDistrictId, deliveryAddressModelWardId: $deliveryAddressModelWardId}";
  }

  @override
  List<Object?> get props => [
        id,
        recieverName,
        phoneNumber,
        detailAddress,
        isDefault,
        city,
        district,
        ward,
        usermodelID,
        createdAt,
        updatedAt,
        deliveryAddressModelCityId,
        deliveryAddressModelDistrictId,
        deliveryAddressModelWardId,
      ];
}
