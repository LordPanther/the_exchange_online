import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LocationModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  LocationModel cloneWith({
    name,
  }) {
    return LocationModel(
      id: id,
      name: name ?? this.name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static LocationModel fromMap(Map<String, dynamic> data) {
    return LocationModel(
      id: data["id"],
      name: data["name"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() =>
      {'id': id, 'name': name, 'createdAt': createdAt, 'updatedAt': updatedAt};

  @override
  String toString() {
    return "LocationModel:{id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
