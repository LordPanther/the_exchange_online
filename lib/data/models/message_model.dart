import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/message_type.dart';

class MessageModel extends Equatable {
  final String id;
  final String? senderId;
  final DateTime? createdAt;
  final MessageType? type;
  final DateTime? updatedAt;

  const MessageModel({
    required this.id,
    this.senderId,
    this.createdAt,
    this.type,
    this.updatedAt,
  });

  MessageModel cloneWith({
    String? senderId,
    DateTime? createdAt,
    MessageType? type,
  }) {
    return MessageModel(
      id: id,
      senderId: senderId ?? this.senderId,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
    );
  }

  static MessageModel fromMap(Map<String, dynamic> data) {
    return MessageModel(
      id: data["id"],
      senderId: data["senderId"],
      createdAt: data["createdAt"],
      type: data["type"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'senderId': senderId,
        'createdAt': createdAt,
        'type': type,
        'updatedAt': updatedAt
      };

  @override
  String toString() {
    return "MessageModel:{id: $id, senderId: $senderId, createdAt: $createdAt, type: $type, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [id, senderId, createdAt, type, updatedAt];
}
