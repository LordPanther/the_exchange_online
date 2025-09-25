import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/data/models/message_type.dart';

class ImageMessageModel extends Equatable {
  final String id;
  final String? senderId;
  final DateTime? createdAt;
  final MessageType? type;
  final String? text;
  final List<String>? images;
  final DateTime? updatedAt;

  const ImageMessageModel({
    required this.id,
    required this.senderId,
    required this.createdAt,
    required this.type,
    this.text,
    required this.images,
    this.updatedAt,
  });

  ImageMessageModel cloneWith({
    senderId,
    createdAt,
    type,
    text,
    images,
  }) {
    return ImageMessageModel(
        id: id,
        senderId: senderId ?? this.senderId,
        createdAt: createdAt ?? this.createdAt,
        type: type ?? this.type,
        text: text ?? this.text,
        images: images ?? this.images);
  }

  static ImageMessageModel fromMap(Map<String, dynamic> data) {
    return ImageMessageModel(
      id: data["id"],
      senderId: data["senderId"],
      type: data["type"],
      text: data["text"],
      images: data["images"],
      createdAt: data["createdAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'createdAt': createdAt,
      'type': type,
      'text': text,
      'images': images,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "TextMessge: {senderId: $senderId, type: $type, text: $text, images: $images, createdAt: $createdAt, text: $text}";
  }

  @override
  List<Object?> get props => [
        id,
        senderId,
        createdAt,
        text,
      ];
}
