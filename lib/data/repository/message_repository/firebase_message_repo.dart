// ignore_for_file: avoid_print

import 'package:the_exchange_online/data/models/message_model.dart';
import 'package:the_exchange_online/data/repository/message_repository/message_repo.dart';

class FirebaseMessageRepository implements MessageRepository {
  /// Get 20 the first messages
  @override
  Stream<List<MessageModel>> fetchRecentMessages({
    required String uid,
    required int messagesLimit,
  }) {
    return const Stream.empty();
  }

  @override
  Future<List<MessageModel>> fetchPreviousMessages({
    required String uid,
    required int messagesLimit,
    required MessageModel lastMessage,
  }) async {
    return [];
  }

  @override
  Future<MessageModel?> getLastestMessage({
    required String uid,
  }) async {
    return null;
  }

  /// Add item

  @override
  Future<void> addMessage(String uid, MessageModel message) async {}

  /// Remove item

  @override
  Future<void> removeMessage(String uid, MessageModel message) async {}

  ///Singleton factory
  static final FirebaseMessageRepository _instance =
      FirebaseMessageRepository._internal();

  factory FirebaseMessageRepository() {
    return _instance;
  }

  FirebaseMessageRepository._internal();
}
