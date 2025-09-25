import 'package:equatable/equatable.dart';

class FeedBackModel extends Equatable {
  final String id;
  final String? userId;
  final int? rating;
  final String? content;
  final String? timesamp;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FeedBackModel(
      {required this.id,
      this.userId,
      this.rating,
      this.content,
      this.timesamp,
      this.createdAt,
      this.updatedAt});

  FeedBackModel cloneWith({
    userId,
    rating,
    content,
    timesamp,
  }) {
    return FeedBackModel(
        id: id,
        userId: userId ?? this.userId,
        rating: rating ?? this.rating,
        content: content ?? this.content,
        timesamp: timesamp ?? this.timesamp);
  }

  static FeedBackModel fromMap(Map<String, dynamic> data) {
    return FeedBackModel(
      id: data["id"],
      userId: data["userId"],
      rating: data["rating"],
      content: data["content"],
      timesamp: data["timesamp"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'userId': userId,
      'rating': rating,
      'content': content,
      'timesamp': timesamp,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return "BannerModel: {id: $id, userId: $userId, rating: $rating, content: $content, timesamp: $timesamp, createdAt: $createdAt, updatedAt: $updatedAt}";
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        rating,
        content,
        timesamp,
        createdAt,
        updatedAt,
      ];
}
