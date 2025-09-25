import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/message_type.dart';

class TextMessageModel extends Equatable {
  final String id;
  final String? senderId;
  final DateTime? createdAt;
  final MessageType? type;
  final String? text;
  final DateTime? updatedAt;

  const TextMessageModel({
    required this.id,
    required this.senderId,
    required this.createdAt,
    required this.type,
    required this.text,
    this.updatedAt,
  });

  TextMessageModel cloneWith(
      {String? senderId,
      DateTime? createdAt,
      MessageType? type,
      String? text}) {
    return TextMessageModel(
      id: id,
      senderId: senderId ?? this.senderId,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      text: text ?? this.text,
    );
  }

  static TextMessageModel fromMap(Map<String, dynamic> data) {
    return TextMessageModel(
      id: data["id"],
      senderId: data["senderId"],
      type: data["type"],
      text: data["text"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'createdAt': createdAt,
      'type': type,
      'text': text,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "TextMessageModel:{senderId: $senderId, createdAt: $createdAt, type: $type, text: $text, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        senderId,
        type,
        text,
        createdAt,
        updatedAt,
      ];
}
