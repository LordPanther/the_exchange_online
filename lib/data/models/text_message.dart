class TextMessage {
  final String id;
  final String? senderId;
  final String? createdAt;
  final String? text;

  const TextMessage({
    required this.id,
    required this.senderId,
    required this.createdAt,
    required this.text,
  });

  TextMessage cloneWith({
    id,
    senderId,
    createdAt,
    text,
  }) {
    return TextMessage(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        createdAt: createdAt ?? this.createdAt,
        text: text ?? this.text);
  }

  static TextMessage fromMap(Map<String, dynamic> data) {
    return TextMessage(
      id: data["id"],
      senderId: data["senderId"],
      createdAt: data["createdAt"],
      text: data["text"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'createdAt': createdAt,
      'text': text,
    };
  }

  @override
  String toString() {
    return "TextMessge: {senderId: $senderId, createdAt: $createdAt, text: $text}";
  }

  List<Object?> get props => [
        id,
        senderId,
        createdAt,
        text,
      ];
}
