class ImageMessage {
  final String id;
  final String? senderId;
  final String? createdAt;
  final String? text;
  final List<String>? images;

  const ImageMessage({
    required this.id,
    required this.senderId,
    required this.createdAt,
    this.text,
    required this.images,
  });

  ImageMessage cloneWith({
    id,
    senderId,
    createdAt,
    text,
    images,
  }) {
    return ImageMessage(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      createdAt: createdAt ?? this.createdAt,
      text: text ?? this.text,
      images: images ?? this.images,
    );
  }

  static ImageMessage fromMap(Map<String, dynamic> data) {
    return ImageMessage(
      id: data["id"],
      senderId: data["senderId"],
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
      'text': text,
      'images': images,
    };
  }

  @override
  String toString() {
    return "ImageMessage: {senderId: $senderId, createdAt: $createdAt, text: $text, images: $images}";
  }

  List<Object?> get props => [
        id,
        senderId,
        createdAt,
        text,
        images,
      ];
}
