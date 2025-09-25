import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String? id;
  final int? code;
  final String? description;
  final String? message;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ErrorModel({
    this.id,
    this.code,
    this.description,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  ErrorModel cloneWith({
    code,
    description,
    message,
  }) {
    return ErrorModel(
        id: id,
        code: code ?? this.code,
        description: description ?? this.description,
        message: message ?? this.message);
  }

  static ErrorModel fromMap(Map<String, dynamic> data) {
    return ErrorModel(
      id: data['id'],
      code: data['code'],
      description: data['description'],
      message: data['message'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'code': code,
        'description': description,
        'message': message,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };

  @override
  String toString() {
    return "ErrorModel:{code: $code, description: $description, message: $message}";
  }

  @override
  List<Object?> get props => [
        code,
        description,
        message,
      ];
}
